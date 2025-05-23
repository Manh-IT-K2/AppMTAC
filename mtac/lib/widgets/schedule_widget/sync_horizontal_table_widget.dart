import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class SyncHorizontalTableWidget extends StatefulWidget {
  final List<Widget> headers;
  final List<List<Widget>> rows;
  final double rowHeight;

  const SyncHorizontalTableWidget({
    super.key,
    required this.headers,
    required this.rows,
    this.rowHeight = 45.0,
  });

  @override
  State<SyncHorizontalTableWidget> createState() => _SyncHorizontalTableWidgetState();
}

class _SyncHorizontalTableWidgetState extends State<SyncHorizontalTableWidget> {
  late LinkedScrollControllerGroup _controllerGroup;
  late ScrollController _headerScrollController;
  late ScrollController _bodyScrollController;

  @override
  void initState() {
    super.initState();
    _controllerGroup = LinkedScrollControllerGroup();
    _headerScrollController = _controllerGroup.addAndGet();
    _bodyScrollController = _controllerGroup.addAndGet();

  }

  @override
  void dispose() {
    _headerScrollController.dispose();
    _bodyScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double tableWidth = widget.headers.fold(0, (sum, cell) {
      if (cell is SizedBox) {
        return sum + (cell.width ?? 0);
      }
      return sum + 105; // fallback width
    });

    return Column(
      children: [
        // Header content
        SingleChildScrollView(
          controller: _headerScrollController,
          scrollDirection: Axis.horizontal,
          child: Row(children: widget.headers),
        ),   
        const SizedBox(height: 10),
        // Body content with Scrollbar
        Expanded(
          child: Scrollbar(
            controller: _bodyScrollController,
            //thumbVisibility: true,
            thickness: 7,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              controller: _bodyScrollController,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: tableWidth,
                child: Column(
                  children: List.generate(widget.rows.length, (index) {
                    return SizedBox(
                      height: widget.rowHeight,
                      child: Row(children: widget.rows[index]),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
