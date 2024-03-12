import 'package:flutter/material.dart';

class CustomScrollList extends StatefulWidget {

  final Widget sliverBody;
  final String title;
  final double? verticalPadding;
  final double? horizontalPadding;

  const CustomScrollList({
    super.key,
    required this.sliverBody, 
    required this.title, 
    this.verticalPadding = 0, 
    this.horizontalPadding = 0,
  });

  @override
  State<CustomScrollList> createState() => _CustomScrollListState();
}

class _CustomScrollListState extends State<CustomScrollList> {
  
  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: <Widget>[
        CustomSliverAppBar( title: widget.title, opacity: _opacity),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: widget.verticalPadding!, horizontal: widget.horizontalPadding!),
          sliver: widget.sliverBody,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: Colors.blueAccent.withOpacity(0),
          ),
        )
      ],
    );
  }

  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double desplazamiento = _scrollController.offset;
    double porcentaje = (desplazamiento / 40).clamp(0, 1); // Asumiendo que la altura expandida es 200
    setState(() {
      _opacity = 1 - porcentaje;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}

class CustomSliverAppBar extends StatelessWidget {

  final double opacity;
  final String title;

  const CustomSliverAppBar({
    super.key,
    required this.opacity, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return SliverAppBar(
      stretch: false,
      collapsedHeight: 50,
      toolbarHeight: 50,
      backgroundColor: colorScheme.primary,
      title: Opacity(
        opacity: (opacity == 0) ? 1 : 0,
        child: Text(
          textAlign: TextAlign.end,
          title, 
          style: textStyles.titleMedium!.copyWith( 
            color: colorScheme.onPrimary,
          ),
        )
      ),
      leading: IconButton( onPressed: () {}, icon: Icon( Icons.arrow_back_ios_new_rounded, color: colorScheme.onPrimary, ),),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined, color: colorScheme.onPrimary,))
      ],
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        expandedTitleScale: 1.3,
        title: SizedBox(
          height: 50,
          width: double.infinity,
          child: Opacity(
            opacity: opacity,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                textAlign: TextAlign.start,
                maxLines: 2,
                title, 
                style: textStyles.titleMedium!.copyWith(
                  fontStyle: FontStyle.italic, 
                  color: colorScheme.onPrimary,
                  overflow: TextOverflow.ellipsis,
                  height: 1.2,
                ),
              ),
            )
          ),
        ),
        background: Container(
          color: colorScheme.primary,
        ),
      ),
    );
  }
} 