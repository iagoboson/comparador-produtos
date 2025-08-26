import axios from 'axios';
import { MercadoLivreSearchResponse, MercadoLivreProduct, SearchFilters } from '../types/product';

class MercadoLivreService {
  private baseURL: string;

  constructor() {
    this.baseURL = process.env.MERCADO_LIVRE_API_URL || 'https://api.mercadolibre.com';
  }

  async searchProducts(filters: SearchFilters): Promise<MercadoLivreSearchResponse> {
    try {
      const params = new URLSearchParams({
        q: filters.query,
        limit: filters.limit?.toString() || '20',
        offset: filters.offset?.toString() || '0'
      });

      if (filters.sort) {
        params.append('sort', filters.sort);
      }

      if (filters.condition) {
        params.append('ITEM_CONDITION', filters.condition);
      }

      const response = await axios.get(`${this.baseURL}/sites/MLB/search?${params}`);
      return response.data;
    } catch (error) {
      console.error('Erro ao buscar produtos no Mercado Livre:', error);
      throw new Error('Falha ao buscar produtos');
    }
  }

  async getProductDetails(productId: string): Promise<MercadoLivreProduct> {
    try {
      const response = await axios.get(`${this.baseURL}/items/${productId}`);
      return response.data;
    } catch (error) {
      console.error('Erro ao buscar detalhes do produto:', error);
      throw new Error('Falha ao buscar detalhes do produto');
    }
  }

  async getProductDescription(productId: string): Promise<string> {
    try {
      const response = await axios.get(`${this.baseURL}/items/${productId}/description`);
      return response.data.plain_text || '';
    } catch (error) {
      console.error('Erro ao buscar descrição do produto:', error);
      return '';
    }
  }

  async getCategories(): Promise<any[]> {
    try {
      const response = await axios.get(`${this.baseURL}/sites/MLB/categories`);
      return response.data;
    } catch (error) {
      console.error('Erro ao buscar categorias:', error);
      return [];
    }
  }

  async getCategoryProducts(categoryId: string, filters: Omit<SearchFilters, 'query'> = {}): Promise<MercadoLivreSearchResponse> {
    try {
      const params = new URLSearchParams({
        limit: filters.limit?.toString() || '20',
        offset: filters.offset?.toString() || '0'
      });

      if (filters.sort) {
        params.append('sort', filters.sort);
      }

      const response = await axios.get(`${this.baseURL}/sites/MLB/search?category=${categoryId}&${params}`);
      return response.data;
    } catch (error) {
      console.error('Erro ao buscar produtos da categoria:', error);
      throw new Error('Falha ao buscar produtos da categoria');
    }
  }
}

export default new MercadoLivreService();
