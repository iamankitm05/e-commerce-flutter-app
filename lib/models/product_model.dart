import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final List<String> images;
  final double oldPrice;
  final double newPrice;
  final double discount;
  final String description;
  final List<String> details;

  const ProductModel({
    required this.id,
    required this.name,
    required this.images,
    required this.oldPrice,
    required this.newPrice,
    required this.discount,
    required this.description,
    required this.details,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        images,
        oldPrice,
        newPrice,
        discount,
        description,
      ];
}

const products = [
  ProductModel(
    id: 1,
    name: "Apple 2020 Macbook Air Apple M1",
    images: [
      "https://rukminim2.flixcart.com/image/416/416/kp5sya80/screen-guard/tempered-glass/o/v/n/apple-macbook-air-m1-13-3-inch-lightwings-original-imag3gh5xftgbpg3.jpeg?q=70&crop=false",
      "https://rukminim2.flixcart.com/image/128/128/kruyw7k0/computer/p/s/p/na-thin-and-light-laptop-apple-original-imag5jt7zpmhsrpm.jpeg?q=70&crop=false",
      "https://rukminim2.flixcart.com/image/128/128/kruyw7k0/computer/x/f/u/na-thin-and-light-laptop-apple-original-imag5jt7uf8mb3fb.jpeg?q=70&crop=false",
      "https://rukminim2.flixcart.com/image/128/128/kruyw7k0/computer/7/s/m/na-thin-and-light-laptop-apple-original-imag5jt7khzzmh4w.jpeg?q=70&crop=false",
    ],
    oldPrice: 99900,
    newPrice: 74990,
    discount: 24,
    description:
        "This Apple Macbook is powered by the Apple M1 chip and is easily portable so that you can carry it with you anywhere you want. This thin and light notebook is equipped with an 8-core CPU to handle all your tasks more efficiently. The 8-core GPU of this notebook takes graphic-intensive games and apps to a whole new level. It also comes with a 16-core Neural Engine to do machine learning tasks more effectively. Its fan-less design offers silent operations and has a long-lasting battery life which can last up to 18 hours on a single charge.",
    details: [
      "Stylish & Portable Thin and Light Laptop",
      "38 cm Full HD WVA AG 120Hz 250 nits Narrow Border",
      "Light Laptop without Optical Disk Drive",
    ],
  ),
  ProductModel(
    id: 2,
    name: "HP 14a",
    images: [
      "https://rukminim2.flixcart.com/image/128/128/xif0q/computer/8/v/o/-original-imagykgpazuthw7t.jpeg?q=70&crop=false",
      "https://rukminim2.flixcart.com/image/128/128/xif0q/computer/y/j/w/chromebook-chromebook-hp-original-imagkwj8afyqfqnr.jpeg?q=70&crop=false",
      "https://rukminim2.flixcart.com/image/128/128/xif0q/computer/y/v/x/chromebook-chromebook-hp-original-imagkwj8kgzrb4my.jpeg?q=70&crop=false",
    ],
    oldPrice: 30001,
    newPrice: 18990,
    discount: 36,
    description:
        "Get an HP Chromebook laptop to boost productivity and add some style to your desk. The HP intel Celeron Dual Core laptop gives a theater-like experience from the comfort of your lap thanks to speakers tuned by B&O's audio specialists and a micro-edge HD+ touch display. Additionally, you can enjoy the dynamic speed you require to get things done thanks to an Intel Core Processor, ample storage, and up to 12-hour battery life. This laptop is a fantastic addition to your workstation since it starts up in less than ten seconds and is regularly updated to perform at its optimum.",
    details: [
      "Stylish & Portable Thin and Light Laptop",
      "38 cm Full HD WVA AG 120Hz 250 nits Narrow Border",
      "Light Laptop without Optical Disk Drive",
    ],
  ),
  ProductModel(
    id: 3,
    name: "DELL Intel Core i3 12th Gen",
    images: [
      "https://rukminim2.flixcart.com/image/128/128/xif0q/computer/n/o/s/-original-imaghzah9mjvukjz.jpeg?q=70&crop=false",
      "https://rukminim2.flixcart.com/image/128/128/xif0q/computer/p/9/z/-original-imaghzahqhjhgrfg.jpeg?q=70&crop=false",
      "https://rukminim2.flixcart.com/image/128/128/xif0q/computer/y/w/x/-original-imaghzamx8vgtthu.jpeg?q=70&crop=false",
      "https://rukminim2.flixcart.com/image/128/128/xif0q/computer/y/w/5/-original-imaghzamxu7k7sws.jpeg?q=70&crop=false",
    ],
    oldPrice: 49518,
    newPrice: 34790,
    discount: 29,
    description:
        "With a PCIe SSD and a 12th-generation Intel Core i3 processor incorporated into this Dell laptop, you can enjoy a quick yet peaceful performance. Additionally, ComfortView software lowers hazardous blue light emissions to keep your eyes pleasant during prolonged viewing sessions. Furthermore, enjoy the large keycaps and a big touchpad that make it simple to access your content. Moreover, the FHD display of this laptop is surrounded by a stylish, slim bezel on three sides, enhancing your visual experience.",
    details: [
      "Stylish & Portable Thin and Light Laptop",
      "38 cm Full HD WVA AG 120Hz 250 nits Narrow Border",
      "Light Laptop without Optical Disk Drive",
    ],
  ),
];
