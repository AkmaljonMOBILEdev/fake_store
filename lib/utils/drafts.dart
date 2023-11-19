// Container(
// padding: EdgeInsets.only(left: editW(20), top: editH(20)),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(14.r)
// ),
// child: Stack(
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Center(child: Image.network(product.image, width: editW(120),height: editH(54),)),
// 12.ph,
// Text("BEST SELLER", style: Theme.of(context).textTheme.labelMedium?.copyWith(
// color: AppColors.c0D6EFD, fontFamily: "Poppins", fontWeight: FontWeight.w600
// ),),
// 4.ph,
// Expanded(
// child: Text(product.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(
// color: AppColors.c6A6A6A,
// ),),
// ),
// 12.ph,
// Text("\$${product.price}", style: Theme.of(context).textTheme.titleSmall?.copyWith(
// fontFamily: "Poppins"
// ),),
//
// ],
// ),
// Align(
// alignment: Alignment.bottomRight,
//
// child: InkWell(
// borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.r)),
// onTap: () {
// // Tap action
// },
// splashColor: AppColors.c6A6A6A, // Splash color
// child: SvgPicture.asset(AppIcons.plus),
// ),
// ),
//
//
//
//
// ],
// ),
// )