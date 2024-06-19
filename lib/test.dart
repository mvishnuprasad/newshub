// Stack(
// fit: StackFit.expand,
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(10),
// child: Image.network(
// 'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
// alignment: Alignment.topCenter,
// fit: BoxFit.cover,
// ),
// ),
// Positioned.fill(
// child: Container(
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.centerRight,
// end: Alignment.bottomRight,
// colors: [
// Colors.transparent,
// Colors.black.withOpacity(0.5),
// ],
// stops: const [0.1, 1.0],
// ),
// ),
// ),
// ),
// ],
// ),