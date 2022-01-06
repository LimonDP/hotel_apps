import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';

class RoomCard extends StatelessWidget {
  final String roomTitle;
  final int roomsize;
  final String imgaeUrl;
  final String roomId;
  RoomCard(
      {Key? key,
      required this.roomId,
      required this.roomTitle,
      required this.roomsize,
      required this.imgaeUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed('/details');
          Navigator.pushNamed(context, '/details',
              arguments: SelectedData(detailsRoomId: roomId));
        },
        child: Column(
          children: [
            Image(
              height: 130,
              fit: BoxFit.cover,
              image: NetworkImage(imgaeUrl),
            ),
            Text(
              roomTitle.toString(),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              //maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('limon')),
                    TextButton(onPressed: () {}, child: const Text('limon')),
                  ],
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(49.0))),
                    onPressed: () {},
                    child: const Icon(Icons.share_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
