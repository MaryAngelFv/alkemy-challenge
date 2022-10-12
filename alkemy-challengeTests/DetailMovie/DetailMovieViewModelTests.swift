//
//  DetailMovieViewModelTests.swift
//  alkemy-challengeTests
//
//  Created by Angelica Ferreira on 12/10/22.
//

import XCTest
@testable import alkemy_challenge

class DetailMovieViewModelTests: XCTestCase {
    var sut: DetailMovieViewModel?
    let detailMovieService = MockDetailMovieService()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DetailMovieViewModel(detailMovieService: detailMovieService)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_getDetailMovie_WhenSucessResponse_ThenCheckData() {
        // Given
        detailMovieService.errorServices = false
        let id = 12345
        // When
        sut?.getDetailMovie(with: id)
        // Then
        XCTAssertTrue(detailMovieService.calls.didGetData)
        XCTAssertNotNil(sut?.detailMovie)
        XCTAssertEqual(sut?.detailMovie?.title, "Hocus Pocus 2")
        XCTAssertEqual(sut?.detailMovie?.summary, "It’s been 29 years since someone lit the Black Flame Candle and resurrected the 17th-century sisters, and they are looking for revenge. Now it is up to three high-school students to stop the ravenous witches from wreaking a new kind of havoc on Salem before dawn on All Hallow’s Eve.")
        XCTAssertEqual(sut?.detailMovie?.image, "/iS9U3VHpPEjTWnwmW56CrBlpgLj.jpg")
        XCTAssertEqual(sut?.detailMovie?.releaseDate, "2022-09-27")
        XCTAssertEqual(sut?.detailMovie?.status, "Released")
    }
    
    func test_getDetailMovie_WhenFailureResponse_ThenGetError() {
        // Given
        detailMovieService.errorServices = true
        let id = 12345
        // When
        sut?.getDetailMovie(with: id)
        // Then
        XCTAssertTrue(detailMovieService.calls.didGetError)
        XCTAssertNil(sut?.detailMovie)
    }
}
    
