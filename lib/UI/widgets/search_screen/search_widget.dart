import 'package:flutter/material.dart';
import 'package:weather_app/UI/widgets/search_screen/square_button.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key, required this.onAddTap}) : super(key: key);
  final VoidCallback onAddTap;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}
final TextEditingController controller = TextEditingController();

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: MediaQuery.of(context).size.height / 6),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 85,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Введите название города",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: SquareButton(
                    onTap: widget.onAddTap
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
