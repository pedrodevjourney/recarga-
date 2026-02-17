# Camada de rede

- **`http_client.dart`**: contrato do cliente HTTP e `ApiException`. Nenhum tipo de biblioteca (Dio, etc.) vaza daqui.
- **`dio_http_client.dart`**: implementação com Dio; único arquivo que importa `dio` e trata `DioException`.
- **`repository_providers.dart`**: cria uma instância do client e expõe os repositórios. Quem consome (router, view models) não conhece Dio.

## Para escalar mais

1. **Contratos de repositório**  
   Ex.: `abstract class LoginRepositoryContract { Future<LoginResponse> login(LoginRequest r); }` e `LoginRepository implements LoginRepositoryContract`.  
   View models dependem do contrato; nos testes você injeta um mock sem tocar em HTTP.

2. **Result / Either**  
   Em vez de `throw LoginFailure`, retornar `Future<Result<LoginResponse, ApiFailure>>`.  
   Erros ficam no tipo; fica mais fácil tratar erros de forma uniforme e adicionar retry/offline depois.

3. **DI (get_it / injectable)**  
   Substituir `getLoginRepository()` por registro no container: facilita mocks, escopo por feature e testes.
