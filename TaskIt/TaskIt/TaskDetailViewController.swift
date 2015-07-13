//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Matthew Wood on 2015-07-01.
//  Copyright (c) 2015 Matthew. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    var detailTaskModel: TaskModel!
    
    // creating the variable here, assigned a value in ViewController.swift
    var mainVC: ViewController!
    
    @IBOutlet weak var taskTextFiled: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.taskTextFiled.text = detailTaskModel.task
        self.subtaskTextField.text = detailTaskModel.subTask
        self.dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        
        var task = TaskModel(task: taskTextFiled.text, subTask: subtaskTextField.text, date: dueDatePicker.date, completed: false)
        // change the detail of the task at the row
        // adds to the first array (uncompleted tasks)
        mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func cancelBarButtonItemPressed(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
