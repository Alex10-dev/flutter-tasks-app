import 'package:flutter/material.dart';

class CustomScrollList extends StatefulWidget {

  final Widget sliverBody;

  const CustomScrollList({
    super.key,
    required this.sliverBody,
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
        CustomSliverAppBar( title: 'Titulo', opacity: _opacity),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          sliver: widget.sliverBody,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: Colors.blueAccent,
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
    // final textStyles = Theme.of(context).textTheme;

    return SliverAppBar(
      stretch: false,
      backgroundColor: colorScheme.primary,
      titleSpacing: 0,
      title: Opacity(
        opacity: (opacity == 0) ? 1 : 0,
        child: Text(title)
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
        titlePadding: EdgeInsets.zero,
        title: Opacity(
          opacity: opacity,
          child: Text(title)
        ),
        background: Container(
          color: colorScheme.primary,
        ),
      ),
    );
  }
}