// SizedBox(
//   height: editH(60),
//   child: ListView.separated(
//     padding: EdgeInsets.only(
//         left: editW(20),
//         right: editW(20),
//         top: editH(16),
//         bottom: editH(24)),
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) {
//       return CategoryHolder(
//         title: categories![index][0].toUpperCase() +
//             categories![index].substring(1),
//         isSelected: false,
//         onTap: () {},
//       );
//     },
//     separatorBuilder: (context, index) {
//       return editW(16).pw;
//     },
//     itemCount: categories!.length,
//   ),
// ),