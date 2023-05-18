enum LoadedType { start, finish }

enum SnackBarType { done, error, warning }

enum NetworkMethod { get, post, delete, path, put }

enum AppFlow { login, register, settings }

enum CustomerType { individual, company }

enum Gender { male, female }

enum CustomerTypeFilter { all, individual, company }

enum ExportInventoryType {
  all,
  sell,
  throwAway,
  broken,
  expired,
  productResend,
  toReturn,
  goToBranch,
  exportDueWrongImport,
  inventoryController,
  other,
}

enum ExportInventoryStatus {
  all,
  canceled,
  waiting,
  completed,
  refunded,
}

enum AddExportInventoryType {
  throwAway,
  broken,
  expired,
  productResend,
  toReturn,
  goToBranch,
  exportDueWrongImport,
  other,
}

enum UserStatus {
  inActive,
  active,
}

enum UserRole {
  admin,
  member,
  head,
  accounting,
}

enum StoreInfoTab {
  storeInfo,
  retailWarehouses,
  generalInfo,
  setting,
}

enum Discount {
  vnd,
  percent;
}

enum VAT {
  percent0,
  percent5,
  percent10,
}

enum InvoiceDetailTab {
  detail,
  prescription,
}
