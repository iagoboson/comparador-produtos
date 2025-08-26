import { Request, Response } from 'express';
import mercadoLivreService from '../services/mercadoLivreService';
import { SearchFilters } from '../types/product';

class ProductController {
  async searchProducts(req: Request, res: Response) {
    try {
      const { query, limit, offset, sort, condition } = req.query;
      
      if (!query || typeof query !== 'string') {
        return res.status(400).json({ 
          error: 'Query parameter é obrigatório' 
        });
      }

      const filters: SearchFilters = {
        query,
        limit: limit ? parseInt(limit as string) : 20,
        offset: offset ? parseInt(offset as string) : 0,
        sort: sort as 'price_asc' | 'price_desc' | 'relevance' | undefined,
        condition: condition as 'new' | 'used' | undefined
      };

      const result = await mercadoLivreService.searchProducts(filters);
      
      res.json({
        success: true,
        data: result,
        message: `Encontrados ${result.results.length} produtos para "${query}"`
      });
    } catch (error) {
      console.error('Erro no controller de busca:', error);
      res.status(500).json({ 
        error: 'Erro interno do servidor',
        message: error instanceof Error ? error.message : 'Erro desconhecido'
      });
    }
  }

  async getProductDetails(req: Request, res: Response) {
    try {
      const { id } = req.params;
      
      if (!id) {
        return res.status(400).json({ 
          error: 'ID do produto é obrigatório' 
        });
      }

      const product = await mercadoLivreService.getProductDetails(id);
      const description = await mercadoLivreService.getProductDescription(id);
      
      res.json({
        success: true,
        data: {
          ...product,
          description
        }
      });
    } catch (error) {
      console.error('Erro ao buscar detalhes do produto:', error);
      res.status(500).json({ 
        error: 'Erro interno do servidor',
        message: error instanceof Error ? error.message : 'Erro desconhecido'
      });
    }
  }

  async getCategories(req: Request, res: Response) {
    try {
      const categories = await mercadoLivreService.getCategories();
      
      res.json({
        success: true,
        data: categories
      });
    } catch (error) {
      console.error('Erro ao buscar categorias:', error);
      res.status(500).json({ 
        error: 'Erro interno do servidor',
        message: error instanceof Error ? error.message : 'Erro desconhecido'
      });
    }
  }

  async getCategoryProducts(req: Request, res: Response) {
    try {
      const { categoryId } = req.params;
      const { limit, offset, sort } = req.query;
      
      if (!categoryId) {
        return res.status(400).json({ 
          error: 'ID da categoria é obrigatório' 
        });
      }

      const filters = {
        limit: limit ? parseInt(limit as string) : 20,
        offset: offset ? parseInt(offset as string) : 0,
        sort: sort as 'price_asc' | 'price_desc' | 'relevance' | undefined
      };

      const result = await mercadoLivreService.getCategoryProducts(categoryId, filters);
      
      res.json({
        success: true,
        data: result
      });
    } catch (error) {
      console.error('Erro ao buscar produtos da categoria:', error);
      res.status(500).json({ 
        error: 'Erro interno do servidor',
        message: error instanceof Error ? error.message : 'Erro desconhecido'
      });
    }
  }
}

export default new ProductController();
