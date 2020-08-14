// https://javiercbk.github.io/json_to_dart/ 根据json 生成实体
class PinCode {
  bool success;
  String errorInfo;
  ErrorInfoDTO errorInfoDTO;
  Data data;
  Null callBackFunction;

  PinCode(
      {this.success,
      this.errorInfo,
      this.errorInfoDTO,
      this.data,
      this.callBackFunction});

  PinCode.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorInfo = json['errorInfo'];
    errorInfoDTO = json['errorInfoDTO'] != null
        ? new ErrorInfoDTO.fromJson(json['errorInfoDTO'])
        : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    callBackFunction = json['callBackFunction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorInfo'] = this.errorInfo;
    if (this.errorInfoDTO != null) {
      data['errorInfoDTO'] = this.errorInfoDTO.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['callBackFunction'] = this.callBackFunction;
    return data;
  }
}

class ErrorInfoDTO {
  UpdateResultDTO updateResultDTO;

  ErrorInfoDTO({this.updateResultDTO});

  ErrorInfoDTO.fromJson(Map<String, dynamic> json) {
    updateResultDTO = json['updateResultDTO'] != null
        ? new UpdateResultDTO.fromJson(json['updateResultDTO'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.updateResultDTO != null) {
      data['updateResultDTO'] = this.updateResultDTO.toJson();
    }
    return data;
  }
}

class UpdateResultDTO {
  bool successful;
  Null validationErrors;

  UpdateResultDTO({this.successful, this.validationErrors});

  UpdateResultDTO.fromJson(Map<String, dynamic> json) {
    successful = json['successful'];
    validationErrors = json['validationErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['successful'] = this.successful;
    data['validationErrors'] = this.validationErrors;
    return data;
  }
}

class Data {
  String domainId;
  String pinCode;

  Data({this.domainId, this.pinCode});

  Data.fromJson(Map<String, dynamic> json) {
    domainId = json['domainId'];
    pinCode = json['pinCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domainId'] = this.domainId;
    data['pinCode'] = this.pinCode;
    return data;
  }
}
