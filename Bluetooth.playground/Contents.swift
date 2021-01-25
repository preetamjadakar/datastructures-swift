import UIKit

import CoreBluetooth

class ViewController: UIViewController {

    var centralManager:CBCentralManager!
    var myPeripheral:CBPeripheral?
    var peripheralList = [CBPeripheral]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // STEP 1: create a concurrent background queue for the central
        let centralQueue: DispatchQueue = DispatchQueue(label: "com.iosbrain.centralQueueName", attributes: .concurrent)
        // STEP 2: create a central to scan for, connect to,
        // manage, and collect data from peripherals
        centralManager = CBCentralManager(delegate: self, queue: centralQueue)
    }
}

// MARK: - CBCentralManagerDelegate methods
extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        default:
            print("Central dont have valid BLE")
            //BLE is not available by some reason(.poweredOff, .unsupported, .unauthorized, .resetting, .unknown etc)
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if peripheralList.contains(peripheral) {

        } else {
            peripheralList.append(peripheral)
            //reload device list
        }
    }

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        myPeripheral = peripheral
        myPeripheral?.delegate = self
        myPeripheral?.discoverServices(nil)
        centralManager?.stopScan()
    }

    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        //re-scan if requires
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print(error?.localizedDescription ?? "error")
    }
}

// MARK: - CBPeripheralDelegate methods
extension ViewController: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        for service in peripheral.services! {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        for characteristic in service.characteristics! {
            // SCALE Data Characteristic
            if characteristic.uuid == CBUUID(string: "FFE1") {
                // Enable the some specific Sensor notifications
                myPeripheral?.setNotifyValue(true, for: characteristic)
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let dataBytes = characteristic.value {
            print(dataBytes)
        }
    }
}
