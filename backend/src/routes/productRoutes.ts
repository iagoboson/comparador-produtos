import { Router } from 'express';
import productController from '../controllers/productController';

const router = Router();

// Buscar produtos
router.get('/search', productController.searchProducts);

// Buscar detalhes de um produto específico
router.get('/:id', productController.getProductDetails);

// Buscar categorias
router.get('/categories', productController.getCategories);

// Buscar produtos por categoria
router.get('/categories/:categoryId', productController.getCategoryProducts);

export default router;
