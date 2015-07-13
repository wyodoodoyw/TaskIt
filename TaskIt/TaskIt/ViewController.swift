//
//  ViewController.swift
//  TaskIt
//
//  Created by Matthew Wood on 2015-05-13.
//  Copyright (c) 2015 Matthew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var baseArray:[[TaskModel]] = []
    
    // var taskArray:[TaskModel] = []
    //var taskArray:[Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        let date1 = Date.from(year: 2014, month: 05, day: 20)
//        let date2 = Date.from(year: 2014, month: 03, day: 3)
//        let date3 = Date.from(year: 2014, month: 12, day: 13)
//        
//        
//        let task1 = TaskModel(task: "Study Chinese", subTask: "Verbs", date: date1, completed: false)
//        let task2 = TaskModel(task: "Eat Dinner", subTask: "Steak and potatoes", date: date2, completed: false          )
//        
//        //let task1:Dictionary<String,String> = ["task": "Study Chinese", "subtask": "Verbs", "date": "01/14/2015"]
//        //let task2:Dictionary<String,String> = ["task": "Eat Dinner", "subtask": "Steak and potatoes", "date": "01/14/2015"]
//        //let task3:Dictionary<String,String> = ["task": "Gym", "subtask": "Leg Day", "date": "01/15/2015"]
//        
//        let taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg day", date: date3, completed: false)]
//        
//        var completedArray = [TaskModel(task: "Code", subTask: "Task Project", date: date2, completed: true)]
//        
//        baseArray = [taskArray, completedArray]
//        
//        self.tableView.reloadData()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // called everytime this VC reappears after a segue
        
//        func sortByDate (taskOne: TaskModel, taskTwo: TaskModel) -> Bool {
//            
//            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//        }
//        
//        taskArray = taskArray.sorted(sortByDate)
        
        // sorts the array of uncompleted tasks
        baseArray[0] = baseArray[0].sorted {
            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
            // comparison logic here
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            
            let detailVC: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            // assigns self to mainVC constant in taskDetailVC
            detailVC.mainVC = self
        }
        else if segue.identifier == "showTaskAdd" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as! AddTaskViewController
            // assigns self to mainVC constant in addTaskVC
            addTaskVC.mainVC = self
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        // for when view controller is modally
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    
    // ======================================================================
    // UITableViewDataSource
    // ======================================================================

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return baseArray.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return number of rows in a section
        
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // indexPath is a way to encapsulate both a section and a row
        
        // create reusable cells, update the information within only
        var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        // access a dictionary within taskArray
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        //cell.dateLabel.text = thisTask.date
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    // ======================================================================
    // UITableViewDelegate
    // ======================================================================
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // called when we tap on a specific row in our tableView, know which tableView and indexPath is tapped
    
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        } else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // allows for swipe, tells what to do when swiped
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0 {
            // create completed task newTask
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: true)

            // add to baseArray (completed)
            baseArray[1].append(newTask)
            
        } else if indexPath.section == 1 {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: false)
            baseArray[0].append(newTask)
            
        }
        // remove thisTask from baseArray
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
    
}
