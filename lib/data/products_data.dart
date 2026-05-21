import '../models/product.dart';

final List<Product> allProducts = [
  // Jackets
  Product(
    id: 'j1',
    name: 'Classic Leather Jacket',
    category: 'Jackets',
    price: 89.99,
    imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description:
        'A timeless leather jacket with a slim fit. Perfect for casual outings or nights out.',
  ),
  Product(
    id: 'j2',
    name: 'Denim Bomber Jacket',
    category: 'Jackets',
    price: 65.00,
    imageUrl: 'https://images.unsplash.com/photo-1544022613-e87ca75a784a?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description:
        'Vintage-inspired denim bomber with ribbed cuffs and a relaxed fit.',
  ),
  Product(
    id: 'j3',
    name: 'Windbreaker Jacket',
    category: 'Jackets',
    price: 52.00,
    imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description:
        'Lightweight windbreaker with a zip-up front, great for outdoor activities.',
  ),

  // Suits
  Product(
    id: 's1',
    name: 'Slim Fit Navy Suit',
    category: 'Suits',
    price: 119.99,
    imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description:
        'Sharp navy blue suit with slim cut tailoring. Ideal for formal events and office wear.',
  ),
  Product(
    id: 's2',
    name: 'Classic Black Suit',
    category: 'Suits',
    price: 115.00,
    imageUrl: 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description:
        'Elegant black suit crafted from premium fabric. A wardrobe essential for every man.',
  ),
  Product(
    id: 's3',
    name: 'Charcoal Business Suit',
    category: 'Suits',
    price: 108.00,
    imageUrl: 'https://images.unsplash.com/photo-1582142306909-195724d33ffc?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description:
        'Versatile charcoal grey suit, perfect from boardroom meetings to dinner events.',
  ),

  // Accessories
  Product(
    id: 'a1',
    name: 'Genuine Leather Belt',
    category: 'Accessories',
    price: 28.00,
    imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&q=80',
    sizes: ['One Size'],
    description:
        'Full-grain leather belt with a classic silver buckle. Fits 28–42 inch waist.',
  ),
  Product(
    id: 'a2',
    name: 'Classic Analog Watch',
    category: 'Accessories',
    price: 85.00,
    imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&q=80',
    sizes: ['One Size'],
    description:
        'Minimalist analog watch with stainless steel case and a genuine leather strap.',
  ),
  Product(
    id: 'a3',
    name: 'Premium Wool Scarf',
    category: 'Accessories',
    price: 35.00,
    imageUrl: 'https://images.unsplash.com/photo-1520903374185-9c6c73a40b5a?w=400&q=80',
    sizes: ['One Size'],
    description:
        'Soft merino wool scarf in a classic herringbone pattern. Keeps you warm in style.',
  ),

  // Casual
  Product(
    id: 'c1',
    name: 'Oxford Button-Down Shirt',
    category: 'Casual',
    price: 45.00,
    imageUrl: 'https://images.unsplash.com/photo-1594938298603-c8148c4b4b45?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description:
        'Crisp oxford cotton shirt that works dressed up or down. A modern wardrobe staple.',
  ),
  Product(
    id: 'c2',
    name: 'Slim Chino Pants',
    category: 'Casual',
    price: 58.00,
    imageUrl: 'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description: 'Stretch chino pants in slim fit. Comfortable enough for all-day wear.',
  ),
  Product(
    id: 'c3',
    name: 'Classic Polo Shirt',
    category: 'Casual',
    price: 38.00,
    imageUrl: 'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=400&q=80',
    sizes: ['S', 'M', 'L', 'XL'],
    description:
        'Pique cotton polo shirt with a relaxed fit. Perfect for smart casual occasions.',
  ),
];
