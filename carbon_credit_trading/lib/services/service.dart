import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/services/auth_service.dart';
import 'package:carbon_credit_trading/services/transaction_service.dart';

ApiClient apiClient = ApiClient(basePath: 'http://34.126.176.49:8080');
AuthenticationResourceApi authenticationResourceApi =
    AuthenticationResourceApi(apiClient);
BuyerControllerApi buyerControllerApi = BuyerControllerApi(apiClient);
FileControllerApi fileControllerApi = FileControllerApi(apiClient);
MediatorAuditControllerApi mediatorAuditControllerApi =
    MediatorAuditControllerApi(apiClient);
PasswordResetResourceApi passwordResetResourceApi =
    PasswordResetResourceApi(apiClient);
RegistrationResourceApi registrationResourceApi =
    RegistrationResourceApi(apiClient);
SellerControllerApi sellerControllerApi = SellerControllerApi(apiClient);
UserControllerApi userControllerApi = UserControllerApi(apiClient);

TransactionService transactionService = TransactionService();
AuthService authService = AuthService(authenticationResourceApi);
