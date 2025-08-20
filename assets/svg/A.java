Align(
  alignment: Alignment.topRight,
  child: CircleAvatar(
    backgroundColor: const Color(0xFFFDD835),
    radius: 14,
    child: ClipOval(
      child: Image.asset(
        "assets/images/arrow.png", // apni asset image ka path
        width: 18,
        height: 18,
        fit: BoxFit.cover,
      ),
    ),
  ),
)
