export interface MercadoLivreProduct {
  id: string;
  title: string;
  price: number;
  currency_id: string;
  available_quantity: number;
  sold_quantity: number;
  condition: string;
  permalink: string;
  thumbnail: string;
  pictures: Array<{
    id: string;
    url: string;
    secure_url: string;
    size: string;
    max_size: string;
    quality: string;
  }>;
  attributes: Array<{
    id: string;
    name: string;
    value_name: string;
  }>;
  seller: {
    id: number;
    nickname: string;
    car_dealer: boolean;
    real_estate_agency: boolean;
    tags: string[];
  };
  shipping: {
    free_shipping: boolean;
    mode: string;
    tags: string[];
    logistic_type: string;
    store_pick_up: boolean;
  };
}

export interface MercadoLivreSearchResponse {
  site_id: string;
  query: string;
  paging: {
    total: number;
    offset: number;
    limit: number;
  };
  results: MercadoLivreProduct[];
}

export interface ProductComparison {
  id: string;
  products: MercadoLivreProduct[];
  createdAt: Date;
  query: string;
}

export interface SearchFilters {
  query: string;
  limit?: number;
  offset?: number;
  sort?: 'price_asc' | 'price_desc' | 'relevance';
  condition?: 'new' | 'used';
}
