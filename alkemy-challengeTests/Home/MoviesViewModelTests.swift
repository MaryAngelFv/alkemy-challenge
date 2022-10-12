//
//  MoviesViewModelTests.swift
//  alkemy-challengeTests
//
//  Created by Angelica Ferreira on 12/10/22.
//

import XCTest
@testable import alkemy_challenge

class MoviesViewModelTests: XCTestCase {
    var sut: MoviesViewModel?
    let moviesService = MockMoviesService()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MoviesViewModel(moviesService: moviesService)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_getMovies_WhenSucessResponse_ThenCheckMoviesCount() {
        // Given
        moviesService.errorServices = false
        // When
        sut?.getPopularMovies()
        let moviesCount = sut?.movieList.count ?? 0
        // Then
        XCTAssertTrue(moviesService.calls.didGetData)
        XCTAssertGreaterThan(moviesCount, 0)
    }
    
    func test_getMovies_WhenFailureResponse_ThenGetError() {
        // Given
        moviesService.errorServices = true
        // When
        sut?.getPopularMovies()
        // Then
        XCTAssertTrue(moviesService.calls.didGetError)
    }
    
    func test_getModel_WhenIndexPathIsValid_ThenGetModel() {
        // Given
        moviesService.errorServices = false
        let mockIndexPath = IndexPath(row: 0, section: 0)
        // When
        sut?.getPopularMovies()
        let model = sut?.getModel(at: mockIndexPath)
        // Then
        XCTAssertEqual(model?.id, 760161)
        XCTAssertEqual(model?.posterPath, "/pHkKbIRoCe7zIFvqan9LFSaQAde.jpg")
        XCTAssertEqual(model?.name, "Orphan: First Kill")
    }
    
    func test_getModel_WhenIndexPathIsNotValid_ThenGetNothing() {
        // Given
        moviesService.errorServices = false
        let mockIndexPath = IndexPath(row: 200, section: 0)
        // When
        sut?.getPopularMovies()
        let model = sut?.getModel(at: mockIndexPath)
        // Then
        XCTAssertNil(model)
    }
}
    
