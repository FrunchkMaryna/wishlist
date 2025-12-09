import axios, { type InternalAxiosRequestConfig } from 'axios'
import { useAuthStore } from './store/auth'

// КРИТИЧНА ЗМІНА: Змінюємо fallback з http://localhost:8000 на /api
const API_BASE = (import.meta.env.VITE_API_BASE as string) || '/api'

const api = axios.create({
  baseURL: API_BASE,
})

api.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  const auth = useAuthStore()
  if (auth.token) {
    config.headers.Authorization = `Bearer ${auth.token}`
  }
  return config
})

export default api