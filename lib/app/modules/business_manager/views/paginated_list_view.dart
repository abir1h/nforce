import 'package:flutter/material.dart';

///Paginated List View
class PaginatedListView<T> extends StatefulWidget {
  final PaginatedListViewController<T> controller;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context) separatorBuilder;
  final Widget Function(BuildContext context) loaderBuilder;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;

  const PaginatedListView({
    Key? key,
    required this.controller,
    required this.itemBuilder,
    required this.loaderBuilder,
    required this.separatorBuilder,
    this.physics, this.padding, this.shrinkWrap=false,
  }) : super(key: key);

  @override
  _PaginatedListViewState<T> createState() => _PaginatedListViewState<T>();
}
class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller._updateStateDelegate = onUpdateState;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(!widget.shrinkWrap)Expanded(
          child: ListView.separated(
            controller: widget.controller._scrollController,
            itemCount: widget.controller._items.length,
            physics: widget.physics,
            padding: widget.padding,
            shrinkWrap: widget.shrinkWrap,
            itemBuilder: (context, index){
              return widget.itemBuilder(context,widget.controller._items[index], index);
            },
            separatorBuilder: (context, index){
              return widget.separatorBuilder(context);
            },
          ),
        ) else ListView.separated(
          controller: widget.controller._scrollController,
          itemCount: widget.controller._items.length,
          physics: widget.physics,
          padding: widget.padding,
          shrinkWrap: widget.shrinkWrap,
          itemBuilder: (context, index){
            return widget.itemBuilder(context,widget.controller._items[index], index);
          },
          separatorBuilder: (context, index){
            return widget.separatorBuilder(context);
          },
        ),
        if(widget.controller._isLoading)
          Container(
            constraints: const BoxConstraints(maxHeight: 32),
            child: widget.loaderBuilder(context),
          ),
      ],
    );
  }

  void onUpdateState() {
    if(mounted) {
      setState(() {
        debugPrint("state_updated");
      });
    }
  }
}
class PaginatedListViewController<T>{
  late List<T> _items;
  late int _pageSize;
  late int _totalItemCount;
  late int _currentPage;
  late int _nextPage;
  late double _loadTriggerOffset;
  late ScrollController _scrollController;

  bool _isLoading = false;
  VoidCallback? _updateStateDelegate;
  Future<bool> Function(int nextPage)? _loadMoreDelegate;

  PaginatedListViewController([int pageSize = 10, double loadTriggerOffset = 150]) {
    _pageSize = pageSize;
    _loadTriggerOffset = loadTriggerOffset;
    _totalItemCount = 0;
    _currentPage = 1;
    _nextPage = 2;
    _items = [];

    _scrollController = ScrollController();
    _scrollController.addListener(_onScrollUpdate);
  }

  void dispose(){
    _scrollController.removeListener(_onScrollUpdate);
    _scrollController.dispose();
  }

  ///Getters
  int get pageSize => _pageSize;
  int get currentPage => _currentPage;
  int get nextPage => _nextPage;
  int get totalItemCount => _totalItemCount;

  ///Setters
  void setTotalItemCount(int count){
    if(count > -1){
      _totalItemCount = count;
    }
  }
  set onLoadMore(Future<bool> Function(int nextPage) function){
    _loadMoreDelegate = function;
  }

  void clear(){
    _items.clear();
    _currentPage = 1;
    _nextPage = 2;
    _updateStateDelegate?.call();
  }
  void addItem(T item){
    _items.add(item);
    _updateStateDelegate?.call();
  }
  void removeItem(T item){
    _items.remove(item);
    _updateStateDelegate?.call();
  }
  void addItems(List<T> items){
    _items.addAll(items);
    _updateStateDelegate?.call();
  }

  int get getItemCount => _items.length;

  void _onScrollUpdate() {
    if(
    !_isLoading
        && _totalItemCount > _items.length
        && _scrollController.position.maxScrollExtent > _loadTriggerOffset
        && _scrollController.position.extentAfter <= _loadTriggerOffset
    ){
      if(_loadMoreDelegate != null){
        _isLoading = true;
        _updateStateDelegate?.call();

        _loadMoreDelegate!(_nextPage).then((value){
          if(value){
            _currentPage = _nextPage;
            _nextPage += 1;
          }
        }).whenComplete((){
          _isLoading = false;
          _updateStateDelegate?.call();
        });
      }
    }
  }
}