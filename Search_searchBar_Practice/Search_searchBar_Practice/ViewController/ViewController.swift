//
//  ViewController.swift
//  Search_searchBar_Practice
//
//  Created by OBMac-13 on 18/02/26.
//

import UIKit
struct Rating: Codable {
    let imdb: Double
    let rottenTomatoes: Int
}
struct Movie : Codable{
    let id: Int
    let title: String
    let year: Int
    let genre: [String]
    let director: String
    let cast: [String]
    let plot: String
    let poster: String
    let rating: Rating
}

class ViewController: UIViewController {

    @IBOutlet weak var tableViewData: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var allMovies: [Movie] = []
    var filteredMovies: [Movie] = []

    


    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewData.delegate = self
        tableViewData.dataSource = self

        searchBar.delegate = self
        searchBar.placeholder = "Search Movies"

        searchBar.scopeButtonTitles = ["All","Action","Sci-Fi","Romance"]
        searchBar.showsScopeBar = true
        searchBar.selectedScopeButtonIndex = 0  

        allMovies = loadMovies()
        filteredMovies = allMovies

        tableViewData.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Current placement:", navigationItem.searchBarPlacement)
    }
    func setupSearchBar(){
        
        
//        let searchBar = UISearchBar()
//        let searchBar = UISearchBar()
        searchBar.placeholder = "Search name"
                searchBar.delegate = self
                searchBar.sizeToFit()

                tableViewData.tableHeaderView = searchBar
        searchBar.showsBookmarkButton = true
        searchBar.showsSearchResultsButton = true

    }
    
//    func setupSearch(){
//        
//        
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.delegate = self
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false
//        //        view.addSubview(searchController.searchBar)
//        var searchBar: UISearchBar {
//            return searchController.searchBar
//        }
//        searchController.obscuresBackgroundDuringPresentation = false
//        definesPresentationContext = true
//        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .automatic
//        
//        //MARK: - UIsearchbar
//        searchController.searchBar.placeholder = "Search Users"
//        searchController.searchBar.showsBookmarkButton = true
//        //        searchController.searchBar.showsCancelButton = true
//        //        searchController.searchBar.showsSearchResultsButton = true
//        
//        searchController.searchBar.prompt = "Enter at least 2 characters"
//        //        searchController.searchBar.text = "Rahul"
//        searchController.searchBar.searchTextField.backgroundColor = .systemGray5
//        searchController.searchBar.searchTextField.textColor = .black
//        searchController.searchBar.searchTextField.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//        searchController.searchBar.searchTextField.font = UIFont(name: "AmericanTypewriter", size: 20)
//        searchController.searchBar.searchTextField.leftView?.tintColor = .systemRed
//        searchController.searchBar.searchTextField.layer.borderColor = UIColor.red.cgColor
//        searchController.searchBar.searchTextField.layer.borderWidth = 1
//        searchController.searchBar.searchTextField.layer.cornerRadius = 10
//        searchController.searchBar.tintColor = .systemRed
//        
//        searchController.searchBar.searchTextField.clearButtonMode = .never
//        
//        //        searchController.searchBar.backgroundImage = UIImage(named: "img1")
//        //        searchController.searchBar.backgroundColor = .yellow
//        searchBar.isTranslucent = true
//        //        searchBar.barStyle = .default
//        searchBar.setImage(
//            UIImage(systemName: "magnifyingglass.circle.fill"),
//            for: .search,
//            state: .normal
//        )
//        searchBar.setImage(
//            UIImage(systemName: "xmark.circle.fill"),
//            for: .bookmark,
//            state: .normal
//        )
//        searchBar.setPositionAdjustment(
//            UIOffset(horizontal: 15, vertical: 0),
//            for: .search
//        )
//        
//        searchController.hidesNavigationBarDuringPresentation = false
//        
//        
//        searchController.automaticallyShowsCancelButton = true
//        //        searchController.searchBar.setShowsCancelButton(false, animated: true)
//        
//        searchController.automaticallyShowsSearchResultsController = true
//        searchController.ignoresSearchSuggestionsForSearchBarPlacementStacked = true
//        
//        
//        searchController.automaticallyShowsScopeBar = true
//        searchController.searchBar.scopeButtonTitles = ["All" , "Action" , "Sci-Fi" , "Romance"]
//        searchBar.setShowsScope(true, animated: true)
//        
//        searchController.searchBar.scopeBarBackgroundImage = UIImage(named: "img2")
//        searchBar.setScopeBarButtonTitleTextAttributes(
//            [
//                .foregroundColor: UIColor.systemGray,
//                .font: UIFont.systemFont(ofSize: 14, weight: .medium)
//            ],
//            for: .normal
//        )
//        
//        searchBar.setScopeBarButtonTitleTextAttributes(
//            [
//                .foregroundColor: UIColor.red,
//                .font: UIFont.systemFont(ofSize: 14, weight: .bold)
//            ],
//            for: .selected
//        )
//        
//    }

    
    
    func loadMovies() -> [Movie] {
        
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            print("JSON not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            return movies
        } catch {
            print("Error: \(error)")
            return []
        }
    }
    
    
    func filterMovies(searchText: String, scope: Int) {

        let searchTextLower = searchText.lowercased()

        filteredMovies = allMovies.filter { movie in

            let matchesScope: Bool

            switch scope {
            case 1:
                matchesScope = movie.genre.contains { $0.lowercased() == "action" }
            case 2:
                matchesScope = movie.genre.contains { $0.lowercased() == "sci-fi" }
            case 3:
                matchesScope = movie.genre.contains { $0.lowercased() == "romance" }
            default:
                matchesScope = true
            }

            if searchTextLower.isEmpty {
                return matchesScope
            }

            let matchesSearch =
            movie.title.lowercased().contains(searchTextLower) ||
            movie.director.lowercased().contains(searchTextLower) ||
            movie.cast.contains { $0.lowercased().contains(searchTextLower) } ||
            movie.genre.contains { $0.lowercased().contains(searchTextLower) } ||
            String(movie.year).contains(searchTextLower)

            return matchesScope && matchesSearch
        }

        // Sort: titles that START with the typed text come first
        if !searchTextLower.isEmpty {
            filteredMovies.sort { a, b in
                let aStarts = a.title.lowercased().hasPrefix(searchTextLower)
                let bStarts = b.title.lowercased().hasPrefix(searchTextLower)
                if aStarts != bStarts { return aStarts }         // prefix match wins
                return a.title.lowercased() < b.title.lowercased() // else alphabetical
            }
        }

        tableViewData.reloadData()
    }
}

extension ViewController : UISearchBarDelegate{
 
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filterMovies(
            searchText: searchText,
            scope: searchBar.selectedScopeButtonIndex
        )
    }
   

    //MARK: - Search btn click
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//
//        let searchText = searchBar.text ?? ""
//
//        if searchText.isEmpty {
//            filteredMovies = allMovies
//        } else {
//            filteredMovies = allMovies.filter {
//                $0.title.lowercased().contains(searchText)
//            }
//        }
//
//        tableViewData.reloadData()
//    }
    
//    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
//        print("Results list tapped")
//        filteredMovies = allMovies
//        let searchText = searchBar.text ?? ""
//        filteredMovies = allMovies.filter {
//            $0.title.lowercased().contains(searchText)
//        }
//    }


    //MARK: - Scopebar change
    func searchBar(_ searchBar: UISearchBar,
                   selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterMovies(
                searchText: searchBar.text ?? "",
                scope: selectedScope
            )
    }
    //MARK: search cancel
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

        searchBar.text = ""
        filteredMovies = allMovies
        tableViewData.reloadData()
        searchBar.resignFirstResponder()
    }
    
    //MARK: - Search Controller Delegate
    func willPresentSearchController(_ searchController: UISearchController) {
        print("Search will appear",#function)
    }

    func didPresentSearchController(_ searchController: UISearchController) {
        print("Search fully appeared",#function)
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        print("Search will dismiss",#function)
    }

    func didDismissSearchController(_ searchController: UISearchController) {
        print("Search fully dismissed",#function)
    }
    
//    func searchController(_ searchController: UISearchController,
//                            willChangeTo newPlacement: UINavigationItem.SearchBarPlacement) {
//
//          print("Will change to:", newPlacement,#function)
//        
//        switch newPlacement {
//            case .inline:
//                view.backgroundColor = .white
//            case .stacked:
//                view.backgroundColor = .systemGroupedBackground
//            default:
//                break
//            }
//
//      }

//      func searchController(_ searchController: UISearchController,
//                            didChangeFrom oldPlacement: UINavigationItem.SearchBarPlacement) {
//
//          print("Did change from:", oldPlacement,#function)
//      }
    
    //MARK: - search bar delegate methods
    
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool
    {
        print("searchBarShouldBeginEditing",#function)
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Editing started",#function)
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
//    func searchBar(_ searchBar: UISearchBar,
//                   shouldChangeTextIn range: NSRange,
//                   replacementText text: String) -> Bool {
//
//        let currentText = searchBar.text ?? ""
//        let updatedText = (currentText as NSString)
//            .replacingCharacters(in: range, with: text)
//
//        return updatedText.count <= 10
//    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("Should end editing")
        return true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Editing ended")
        searchBar.setShowsCancelButton(false, animated: true)
    }




    
}


extension ViewController: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = filteredMovies[indexPath.row].title
        cell.detailTextLabel?.text = String(filteredMovies[indexPath.row].year)

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
           
        vc.movie = filteredMovies[indexPath.row]


           navigationController?.pushViewController(vc, animated: true)
    }
}

