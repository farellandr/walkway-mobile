import 'package:walkway_mobile/models/brand.dart';
import 'package:walkway_mobile/models/category.dart';
import 'package:walkway_mobile/models/product.dart';
import 'package:walkway_mobile/models/size.dart';

class Data {
  static final List<Brand> brands = [
    Brand(
      id: '18177f14-c8e5-4a7f-8c45-33e009ecb4f4',
      name: 'Adidas',
      logo: 'assets/images/brands/adidas-logo.png',
    ),
    Brand(
      id: 'c06811a9-c0bf-40f7-b64a-5a63dd5d07d6',
      name: 'Air Jordan',
      logo: 'assets/images/brands/air-jordan-logo.png',
    ),
    Brand(
      id: '91e49aa3-ab1b-458e-834e-4daf954bae53',
      name: 'Asics',
      logo: 'assets/images/brands/asics-logo.png',
    ),
    Brand(
      id: '6cdc01a4-a624-4734-a37a-2363cfac2b90',
      name: 'Converse',
      logo: 'assets/images/brands/converse-logo.png',
    ),
    Brand(
      id: '942119ff-4cec-44e6-ab51-63a1121880ed',
      name: 'New Balance',
      logo: 'assets/images/brands/new-balance-logo.png',
    ),
    Brand(
      id: '4db783e3-2104-4206-bc6f-46b0765d8366',
      name: 'Nike',
      logo: 'assets/images/brands/nike-logo.png',
    ),
    Brand(
      id: '6bcf125e-f9ad-491a-a7a6-6812c7fb7569',
      name: 'Reebok',
      logo: 'assets/images/brands/reebok-logo.png',
    ),
    Brand(
      id: 'a373a777-f963-4a54-a681-4e70c82180cd',
      name: 'Vans',
      logo: 'assets/images/brands/vans-logo.png',
    ),
  ];

  static final List<Category> categories = [
    Category(
      id: '8a651fa6-ffc5-4419-ac74-59b6680f6ebd',
      name: 'Casual',
    ),
    Category(
      id: 'a9a02f7a-6cc8-476d-b3d9-d6f4a350f8ae',
      name: 'Running',
    ),
    Category(
      id: 'af6fc5e2-f255-4ad4-8c74-cc027a1faa58',
      name: 'Sneakers',
    ),
    Category(
      id: 'eb5d140c-4e16-4d12-b491-bd55201aabd8',
      name: 'Sport',
    ),
    Category(
      id: '4fb9b9da-31d8-487c-8e82-13935271be96',
      name: 'Basketball',
    ),
  ];

  static final List<Product> products = [
    Product(
      id: '87e6b583-aa64-42b4-b2f2-11e594a009d7',
      name: 'Handball Spezial Night Indigo',
      price: 1660000,
      brand: brands[0],
      categories: [categories[0], categories[2]],
      sizes: [
        ProductSize(
            id: '93bd1209-9690-4c1e-b3b3-cf7ec8e89612', size: 6.0, stock: 14),
        ProductSize(
            id: '71c5ab5d-edd0-42c6-9c7c-a757e9e0f97b', size: 6.5, stock: 12),
        ProductSize(
            id: '99f7f46b-0182-4392-b68c-09b178fa0f5c', size: 7.0, stock: 10),
        ProductSize(
            id: '1b2c42c2-f020-4584-8d0f-e6cf416ec464', size: 7.5, stock: 13),
        ProductSize(
            id: '098b4808-c72c-44b6-af47-3a0360d8f4f9', size: 8.0, stock: 11),
        ProductSize(
            id: '8f99dbfd-6de0-4323-b8a5-3a13d7ade48d', size: 8.5, stock: 9),
        ProductSize(
            id: '2978a028-88fa-431d-bb73-50a2706c3b68', size: 9.0, stock: 15),
        ProductSize(
            id: 'd2df322f-1eb3-4366-b65a-7065559f838f', size: 9.5, stock: 10),
        ProductSize(
            id: '9c04c7a1-6007-439f-ada9-0f3a26ffe828', size: 10.0, stock: 12),
        ProductSize(
            id: '2064f8fa-4853-429b-b8fa-a55b36f97827', size: 10.5, stock: 11),
        ProductSize(
            id: '97a63741-bf61-43b8-8158-626c1a742d87', size: 11.0, stock: 10),
        ProductSize(
            id: 'd6c24619-298b-4018-9717-1e30fbc3532e', size: 11.5, stock: 9),
        ProductSize(
            id: '4275da6b-f66b-41f9-81ec-dc525b4e1daf', size: 12.0, stock: 14),
        ProductSize(
            id: '4c0c5f67-a6b9-4c70-870e-41428d23ee84', size: 12.5, stock: 13),
        ProductSize(
            id: 'a21bbe09-fc50-466b-ac60-269cbd7cf369', size: 13.0, stock: 10),
      ],
      images: [
        'assets/images/sneakers/handball-spezial-night-indigo-1.png',
      ],
    ),
    Product(
      id: '74a15082-07e5-4abd-9cf1-c7aff4cb9b37',
      name: '530 Ivory',
      price: 1050000,
      brand: brands[4],
      categories: [categories[0], categories[1]],
      sizes: [
        ProductSize(
            id: 'ce1526cd-c138-4f4c-96a9-411d7443a053', size: 6.0, stock: 14),
        ProductSize(
            id: '4c9859df-577d-4105-850a-e28437511b9f', size: 6.5, stock: 12),
        ProductSize(
            id: 'a8dd686d-e73c-4e0c-b5c5-791811f4f692', size: 7.0, stock: 10),
        ProductSize(
            id: '853e7bf0-fbd1-4bfd-a6ce-11ed0632568f', size: 7.5, stock: 13),
        ProductSize(
            id: '53607925-d57f-49ac-b0b5-700fe520946e', size: 8.0, stock: 11),
        ProductSize(
            id: 'aa5fea3e-42c0-4988-b338-f544b4ffcb2b', size: 8.5, stock: 9),
        ProductSize(
            id: '8c1c13aa-ee7d-4d54-8780-1c92685e7e09', size: 9.0, stock: 15),
        ProductSize(
            id: 'dbe779eb-c337-4412-9e53-b7be3529db35', size: 9.5, stock: 10),
        ProductSize(
            id: 'fccd0e61-368a-455c-8b38-bb3a6f1403fe', size: 10.0, stock: 12),
        ProductSize(
            id: '9e0d5e9f-5e00-4072-bdc4-a6f44b174751', size: 10.5, stock: 11),
        ProductSize(
            id: '2585bf12-5c65-45ca-af2b-99b565553965', size: 11.0, stock: 10),
        ProductSize(
            id: '8684ab7a-99b3-4107-b3d2-632db085a583', size: 11.5, stock: 9),
        ProductSize(
            id: '9a0968db-1c9f-4673-a025-f50e155f3941', size: 12.0, stock: 14),
        ProductSize(
            id: '08f7cc8b-f91b-465d-8432-88e82e53282a', size: 12.5, stock: 13),
        ProductSize(
            id: '310e8eff-7e11-4c4c-a52c-eda393e14145', size: 13.0, stock: 10),
      ],
      images: [
        'assets/images/sneakers/530-ivory-1.png',
        'assets/images/sneakers/530-ivory-2.png',
        'assets/images/sneakers/530-ivory-3.png',
        'assets/images/sneakers/530-ivory-4.png',
      ],
    ),
    Product(
      id: 'ef3a632b-c931-4de8-b905-d34119fe72df',
      name: '1 Retro Low OG SP Travis Scott Velvet Brown',
      price: 4640000,
      brand: brands[1],
      categories: [categories[0], categories[2], categories[4]],
      sizes: [
        ProductSize(
            id: 'c55d4d96-8cbb-430f-973c-4945cd10ec7b', size: 6.0, stock: 14),
        ProductSize(
            id: 'e5435777-a9a1-422e-800e-e57ac1f090de', size: 6.5, stock: 12),
        ProductSize(
            id: '766aad67-8d83-48cd-9e00-f36477db1d2a', size: 7.0, stock: 10),
        ProductSize(
            id: 'e5460752-58ab-4b07-a871-50cdb44f3ee0', size: 7.5, stock: 13),
        ProductSize(
            id: '85b83164-43f4-438e-9a59-ac1b5857755b', size: 8.0, stock: 11),
        ProductSize(
            id: '033f7951-fb93-459d-a381-a501c21c6f53', size: 8.5, stock: 9),
        ProductSize(
            id: '86bd1bf2-2b30-4d54-b7ef-83a7ae67cb22', size: 9.0, stock: 15),
        ProductSize(
            id: '2421dbfb-499c-45c9-9119-b8818ac71f80', size: 9.5, stock: 10),
        ProductSize(
            id: '43cf79e8-f033-4f58-8742-6f0b05523418', size: 10.0, stock: 12),
        ProductSize(
            id: '2bcc1918-16e9-45a5-906f-d25c05305060', size: 10.5, stock: 11),
        ProductSize(
            id: '6a8d995c-58fd-4531-ae73-6c1822a5e3ba', size: 11.0, stock: 10),
        ProductSize(
            id: '215d9e05-e44e-4bda-a545-bf1a3f52fd61', size: 11.5, stock: 9),
        ProductSize(
            id: 'f7b8087a-a5c3-4747-b605-1bb0f6816a8a', size: 12.0, stock: 14),
        ProductSize(
            id: 'b966b856-3513-4324-a3b7-b6ffa7432cf9', size: 12.5, stock: 13),
        ProductSize(
            id: '10a00e96-5240-488e-8970-fac748151783', size: 13.0, stock: 10),
      ],
      images: [
        'assets/images/sneakers/1-retro-low-og-sp-travis-scott-velvet-brown-1.png',
        'assets/images/sneakers/1-retro-low-og-sp-travis-scott-velvet-brown-2.png',
        'assets/images/sneakers/1-retro-low-og-sp-travis-scott-velvet-brown-3.png',
        'assets/images/sneakers/1-retro-low-og-sp-travis-scott-velvet-brown-4.png',
      ],
    ),
    Product(
      id: 'c4d55750-9f44-40ec-8c67-a3b9b44501bb',
      name: 'Dunk Low Retro White Black Panda',
      price: 1100000,
      brand: brands[5],
      categories: [categories[2], categories[4]],
      sizes: [
        ProductSize(
            id: 'cd8bca22-91f4-4dba-ae0f-ed1e0f76387e', size: 6.0, stock: 14),
        ProductSize(
            id: '52158a42-5be8-4973-89d2-827fe90e5f2e', size: 6.5, stock: 12),
        ProductSize(
            id: '4b0d76a6-ab3f-4fc2-b9fc-6d1868afeb39', size: 7.0, stock: 10),
        ProductSize(
            id: '1c1a9921-22db-49bc-bcf4-a1250e40301c', size: 7.5, stock: 13),
        ProductSize(
            id: '2ad66e87-e265-4ece-994e-72efc6827ec2', size: 8.0, stock: 11),
        ProductSize(
            id: 'c0c973eb-e801-4768-b737-175d6afc530d', size: 8.5, stock: 9),
        ProductSize(
            id: 'e999015a-424e-4857-b517-44129f7b4abc', size: 9.0, stock: 15),
        ProductSize(
            id: '9f38f947-a346-496f-ace6-bed07861e5ce', size: 9.5, stock: 10),
        ProductSize(
            id: 'a9089c35-6130-47eb-88cc-86aa66e37d88', size: 10.0, stock: 12),
        ProductSize(
            id: 'e0ab60d3-c5f6-4fb3-82ca-1152fef4113f', size: 10.5, stock: 11),
        ProductSize(
            id: '580effd6-b363-47f3-a8ec-4e4769920287', size: 11.0, stock: 10),
        ProductSize(
            id: '3f609c11-8e35-47e8-b1dc-99d1a3106073', size: 11.5, stock: 9),
        ProductSize(
            id: '0c8d2074-9f41-4c34-881a-69b93b84226d', size: 12.0, stock: 14),
        ProductSize(
            id: '1f93b88b-e747-485e-853a-8e8e1f966519', size: 12.5, stock: 13),
        ProductSize(
            id: '2e9eb6b5-1880-4bdd-9adb-94a302689364', size: 13.0, stock: 10),
      ],
      images: [
        'assets/images/sneakers/dunk-low-retro-white-black-panda-1.png',
        'assets/images/sneakers/dunk-low-retro-white-black-panda-2.png',
        'assets/images/sneakers/dunk-low-retro-white-black-panda-3.png',
        'assets/images/sneakers/dunk-low-retro-white-black-panda-4.png',
      ],
    ),
    Product(
      id: 'dfcfaaac-15ca-4ce4-9c6b-455013714ad8',
      name: 'Authentic Greener Pastures',
      price: 495000,
      brand: brands[7],
      categories: [categories[0], categories[2]],
      sizes: [
        ProductSize(
            id: 'f8cc22bd-40e3-4899-b44f-f30f4f331544', size: 6.0, stock: 14),
        ProductSize(
            id: '5ae61353-b734-4962-af03-6b27665ff52d', size: 6.5, stock: 12),
        ProductSize(
            id: 'd00aa33f-108c-4b39-8902-07b6e0d61baf', size: 7.0, stock: 10),
        ProductSize(
            id: '11835261-a270-4165-8f9b-03fa079795de', size: 7.5, stock: 13),
        ProductSize(
            id: '6407c520-ae5e-4aca-bac0-8259b6ef3c1c', size: 8.0, stock: 11),
        ProductSize(
            id: 'c4c5b3d9-5286-402f-ae6c-1ae5f9a97b7f', size: 8.5, stock: 9),
        ProductSize(
            id: '9e16e0be-af98-46ac-8014-b66a83874be1', size: 9.0, stock: 15),
        ProductSize(
            id: '50496152-5bbf-47b4-8788-b4c68ddfab38', size: 9.5, stock: 10),
        ProductSize(
            id: 'c257e5db-4eb7-4b75-98c4-326f8a1fd922', size: 10.0, stock: 12),
        ProductSize(
            id: 'd533257f-c52c-48bb-9829-4cd20bbd21af', size: 10.5, stock: 11),
        ProductSize(
            id: 'fb90826c-10ff-4ca9-b7b6-019a1db4aefd', size: 11.0, stock: 10),
        ProductSize(
            id: 'c0e78ec1-e69f-49c6-aef7-1e035004fe34', size: 11.5, stock: 9),
        ProductSize(
            id: 'd9da2066-c222-42b6-b2c5-5dac18d8668f', size: 12.0, stock: 14),
        ProductSize(
            id: 'a50d7f34-8b7d-46c2-ad6d-e4b70ca13d33', size: 12.5, stock: 13),
        ProductSize(
            id: 'f560e563-eed2-42bd-a525-6d456f0b6bec', size: 13.0, stock: 10),
      ],
      images: [
        'assets/images/sneakers/authentic-greener-pastures-1.png',
        'assets/images/sneakers/authentic-greener-pastures-2.png',
        'assets/images/sneakers/authentic-greener-pastures-3.png',
        'assets/images/sneakers/authentic-greener-pastures-4.png',
      ],
    ),
  ];
}
