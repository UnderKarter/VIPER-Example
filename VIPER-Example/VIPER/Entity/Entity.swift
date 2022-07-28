//
//  Entity.swift
//  VIPER-Example
//
//  Created by temp user on 28.07.2022.
//

import Foundation
import UIKit

// Model

struct Section {
    let title: String
    let option: [SettingsOptionType]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsSwitchType {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var isSwitch: Bool
    let handler: (() -> Void)
}

struct SettingsAttantionType {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var attantionNumber: String
    let attantionBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsModeStatusType {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var selectedMode: String
    let handler: (() -> Void)
}

enum SettingsOptionType {
    case cell (model: SettingsOption)
    case switchCell (model: SettingsSwitchType)
    case attantionCell (model: SettingsAttantionType)
    case statusModeCell (model: SettingsModeStatusType)
}

//MARK: - Configurate Section and Cells

class SettingsModel {
    func configurate() -> [Section] {
        return [
            //MARK: - First Section
            Section(title: "Связь", option: [
                .switchCell(model: SettingsSwitchType(
                    title: "Авиарежим",
                    icon: UIImage(systemName: "airplane"),
                    iconBackgroundColor: UIColor.systemOrange,
                    isSwitch: false){
                    print("Нажата ячейка Авиарежим")
                }),
                .statusModeCell(model: SettingsModeStatusType(
                    title: "Wi-Fi",
                    icon: UIImage(systemName: "wifi"),
                    iconBackgroundColor: UIColor.systemBlue,
                    selectedMode: "Не подключено"){
                    print("Нажата ячейка Wi-Fi")
                }),
                .statusModeCell(model: SettingsModeStatusType(
                    title: "Bluetooth",
                    icon: UIImage(systemName: "phone.connection"),
                    iconBackgroundColor: UIColor.systemBlue,
                    selectedMode: "Вкл."){
                    print("Нажата ячейка Bluetooth")
                }),
                .cell(model: SettingsOption(
                    title: "Сотовая связь",
                    icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                    iconBackgroundColor: UIColor.systemGreen){
                    print("Нажата ячейка Сотовая связь")
                }),
                .statusModeCell(model: SettingsModeStatusType(
                    title: "Режим модема",
                    icon: UIImage(systemName: "personalhotspot"),
                    iconBackgroundColor: UIColor.systemGreen,
                    selectedMode: "Выкл."){
                    print("Нажата ячейка Режим модема")
                }),
                .statusModeCell(model: SettingsModeStatusType(
                    title: "VPN",
                    icon: UIImage(systemName: "globe"),
                    iconBackgroundColor: UIColor.systemBlue,
                    selectedMode: "Не подключено"){
                    print("Нажата ячейка VPN")
                })
            ]),

            //MARK: - Second Section
            Section(title: "Звуки, Экран и уведомления", option: [
                .cell(model: SettingsOption(
                    title: "Уведомления",
                    icon: UIImage(systemName: "house"),
                    iconBackgroundColor: UIColor.systemRed){
                    print("Нажата ячейка Уведомления")
                }),
                .cell(model: SettingsOption(
                    title: "Звуки, тактильные сигналы",
                    icon: UIImage(systemName: "speaker.wave.3.fill"),
                    iconBackgroundColor: UIColor.magenta){
                    print("Нажата ячейка Звуки, тактильные сигналы")
                }),
                .cell(model: SettingsOption(
                    title: "Не беспокоить",
                    icon: UIImage(systemName: "moon.fill"),
                    iconBackgroundColor: UIColor.systemIndigo){
                    print("Нажата ячейка Не беспокоить")
                }),
                .cell(model: SettingsOption(
                    title: "Экранное время",
                    icon: UIImage(systemName: "hourglass"),
                    iconBackgroundColor: UIColor.systemIndigo){
                    print("Нажата ячейка Экранное время")
                })
            ]),

            //MARK: - Third Section
            Section(title: "Основные", option: [
                .attantionCell(model: SettingsAttantionType(
                    title: "Основные",
                    icon: UIImage(systemName: "gear"),
                    iconBackgroundColor: UIColor.systemGray3,
                    attantionNumber: "2",
                    attantionBackgroundColor: UIColor.systemRed){
                    print("Нажата ячейка Основные")
                }),
                .cell(model: SettingsOption(
                    title: "Пункт управления",
                    icon: UIImage(systemName: "airport.express"),
                    iconBackgroundColor: UIColor.systemGray3){
                    print("Нажата ячейка Пункт управления")
                }),
                .cell(model: SettingsOption(
                    title: "Экран и яркость",
                    icon: UIImage(systemName: "textformat.size"),
                    iconBackgroundColor: UIColor.systemBlue){
                    print("Нажата ячейка Экран и яркость")
                }),
                .cell(model: SettingsOption(
                    title: "Экран Домой",
                    icon: UIImage(systemName: "iphone.homebutton"),
                    iconBackgroundColor: UIColor.systemGreen){
                    print("Нажата ячейка Экран Домой")
                }),
                .cell(model: SettingsOption(
                    title: "Универсальный доступ",
                    icon: UIImage(systemName: "command.circle"),
                    iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Универсальный доступ")
                }),
                .cell(model: SettingsOption(
                    title: "Обои",
                    icon: UIImage(systemName: "circle.hexagongrid"),
                    iconBackgroundColor: .cyan) {
                    print("Нажата ячейка Обои")
                }),
                .cell(model: SettingsOption(
                    title: "Siri и Поиск",
                    icon: UIImage(systemName: "magnifyingglass"),
                    iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Siri и Поиск")
                }),
                .cell(model: SettingsOption(
                    title: "Face ID и код-пфроль",
                    icon: UIImage(systemName: "faceid"),
                    iconBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Face ID и код-пфроль")
                }),
                .cell(model: SettingsOption(
                    title: "Экстренный вызов - SOS",
                    icon: UIImage(systemName: "cross.circle.fill"),
                    iconBackgroundColor: .systemRed) {
                    print("Нажата ячейка Экстренный вызов - SOS")
                }),
                .cell(model: SettingsOption(
                    title: "Уведомления о контакте",
                    icon: UIImage(systemName: "sun.min"),
                    iconBackgroundColor: .red) {
                    print("Нажата ячейка Уведомления о контакте")
                }),
                .cell(model: SettingsOption(
                    title: "Аккумулятор",
                    icon: UIImage(systemName: "battery.75"),
                    iconBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Аккумулятор")
                }),
                .cell(model: SettingsOption(
                    title: "Конфиденциальность",
                    icon: UIImage(systemName: "key.icloud"),
                    iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Конфиденциальность")
                })
            ])
        ]
    }
}

