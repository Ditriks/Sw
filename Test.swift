import XCTest
@testable import UnitTestExample

class UnitTestExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Метод вызывается перед вызовом каждого тестового метода в классе.
    }

    override func tearDownWithError() throws {
        // Метод вызывается после вызова каждого тестового метода в классе.
    }

    func testExample() throws {
        // Пример функционального теста
    }

    func testPerformanceExample() throws {
        // Пример теста производительности.
        measure {
            
        }
    }
}


// testExample() - метод, в котором прописывается код самого теста
// testPerformanceExample() - метод, который тестирует производительность размещённого в нём кода


// XCTAssert - утверждает, что выражение истинно
// XCTAssertNil - утверждает, что выражение является nil
// XCTAssertNotNil - утверждает, что выражение не является nil
// XCTUnwrap - утверждает, что выражение не является Nil, и возвращает развернутое значение
// XCTAssertEqual - утверждает, что два значения равны
// XCTAssertNotEqual - утверждает, что два значения не равны
// XCTAssertIdentical - утверждает, что два значения идентичны
// XCTAssertNotIdentical - утверждает, что два значения не идентичны
// XCTAssertGreaterThan - утверждает, что значение первого выражения больше значения второго выражения
// XCTAssertGreaterThanOrEqual - утверждает, что значение первого выражения больше или равно значению второго выражения
// XCTAssertLessThanOrEqual - утверждает, что значение первого выражения меньше или равно значению второго выражения
// XCTAssertLessThan - утверждает, что значение первого выражения меньше значения второго выражения
// XCTAssertThrowsError - утверждает, что выражение вызывает ошибку
// XCTAssertNoThrow - утверждает, что выражение не вызывает ошибку
// XCTFail - генерация немедленной остановки
// XCTSkip - принудительный пропуск теста


// XCTClockMetric() - показывает время за которое выполнился тест
// XCTCPUMetric() - показывает взаимодействие с CPU (время, циклы, количество инструкций)
// XCTStorageMetric() - измерение объёма данных, которые потенциально будут записаны в хранилище при выполнении указанного блока кода
// XCTMemoryMetric() - показания использования оперативной памяти