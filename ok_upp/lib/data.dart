class ChonghwaEnv{
  final int position;
  final String name;
  final String image;
   
  ChonghwaEnv(
    this.position,{
      required this.name,
      required this.image,
    }
  );                                 
}

List<ChonghwaEnv>chonghwaenv = [
  ChonghwaEnv(
    1,
    name: 'chonghwa no1',
    image: 'assets/images/chonghwa3.jpg',
    ),

  ChonghwaEnv(
    2,
    name: 'chonghwa no2',
    image: 'assets/images/chonghwa2.jpg',
  ),

  ChonghwaEnv(
    3,
    name: 'chonghwa no4',
    image: 'assets/images/chonghwa4.jpg',
  ),

  ChonghwaEnv(
    4,
    name: 'chonghwa no1',
    image: 'assets/images/chonghwa1.jpg',
  ),

  ChonghwaEnv(
    5,
    name: 'chonghwa no5',
    image: 'assets/images/chonghwa5.jpg',
  ),      
];

