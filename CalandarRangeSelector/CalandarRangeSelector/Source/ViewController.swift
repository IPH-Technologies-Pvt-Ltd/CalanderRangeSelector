//
//  ViewController.swift
//  DateRangePicker
//
//  Created by iPHTech 23 on 03/01/24.

import Fastis
import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    private var currentValue: FastisValue?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        chooseRange()
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Date Range Selector"
        self.navigationItem.largeTitleDisplayMode = .always
        self.currentValue = nil
    }
    
    // MARK: - Actions
    
    func chooseRange() {
        self.dateFormatter.calendar = .current
        let fastisController = FastisController(mode: .range)
        fastisController.title = "Choose range"
        fastisController.initialValue = self.currentValue as? FastisRange
        fastisController.minimumDate = Calendar.current.date(byAdding: .month, value: -2, to: Date())
        fastisController.maximumDate = Calendar.current.date(byAdding: .month, value: 3, to: Date())
        fastisController.allowToChooseNilDate = true
        fastisController.shortcuts = [.today, .lastWeek, .lastMonth]
        fastisController.dismissHandler = { [weak self] action in
            switch action {
            case .done(_):
                print("no actions")
            case .cancel:
                print("no actions")
            }
        }
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.pushViewController(fastisController, animated: true)

    }
}
