//
//  ApiErrorModel.swift
//  Data
//
//  Created by 1 on 13.12.2020.
//

import AppFoundation

/// Стандартная модель ошибки
public struct ApiErrorModel: Decodable {
    
    // MARK: - Public properties
    
    /// Информативный код ошибки.
    /// * К нему может быть привязана бизнес-логика приложения.
    /// * Не соотносится с HTTP статус-кодами запроса
    public let code: Int
    
    /// User-friendy сообщение об ошибке
    /// * Можно использовать его в Alert-e для уведомления пользователя об ошибке
    public let message: String
    
    /// Код внешней системы.
    /// Мобильный бекенд может в случае неизвестной ситуации вернуть в нем код ошибки внешнего сервиса
    public let externalCode: String?
    
    /// Сообщение, возвращаемое бекендом в случае неизвестных ситуаций или для возможности дебага.
    /// * Может быть информативным в частности для аналитиков.
    /// * Может содержать техническое описание ошибки внешней системы, к которой обращался мобильный бекенд
    /// * Может содержать информацию
    public let details: String?
    
    /// Идентификатор ошибки
    public let uuid: String?
    
    /// Наименование сервиса, например "communication-gateway"
    public let domain: String?
    
    // MARK: - Init
    
    public init(
        code: Int,
        message: String,
        externalCode: String? = nil,
        details: String? = nil,
        uuid: String? = nil,
        domain: String? = nil
    ) {
        self.code = code
        self.message = message
        self.externalCode = externalCode
        self.details = details
        self.uuid = uuid
        self.domain = domain
    }
    
}

// MARK: - LocalizedError

extension ApiErrorModel: LocalizedError {
    public var errorDescription: String? {
        return message
    }
}

// MARK: - ComposableError

extension ApiErrorModel: HierarchyError {
    public var parentHierarchyError: HierarchyError? {
        return nil
    }
    
    public var errorCode: String {
        return "API-"+String(code)
    }
}
