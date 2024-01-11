# Samsung-notes-for-windows-installer

!(notes.ico)[notes.ico]

## 使用说明

### 在线安装
推荐的使用方式是执行 Install Samsung Notes and Samsung Account(online) 与 Generate desktop shortcut(by Direct launch)，即依次执行2与7。

### 本地安装
- 如果认为下载较慢，可以将 SamsungNotes.Msixbundle 与 SamsungAccount.Msixbundle 通过[Online link generator for Microsoft Store.](https://store.rg-adguard.net/)下载，并放到在工具目录简历 aapx 文件夹，并重命名为上述文件名。
1. 检查 './aapx/SamsungNotes.Msixbundle' 与 './aapx/SamsungAccount.Msixbundle'
存在。
2. 开启 [旁加载](https://learn.microsoft.com/zh-cn/windows/application-management/sideload-apps-in-windows)。
3. 执行 Install Samsung Notes and Samsung Account(local) 与 Generate desktop shortcut(by Direct launch)，即依次执行1与7。

## 创建桌面快捷方式
创建快捷方式，会创建 'C:\Samsung_Notes' 文件夹，并通过 Directlaunch （关闭应用取消模拟）的方法来创建快捷方式，请不要移动该文件夹文件。

## Galaxybook Mask
众所周知的原因，现在使用三星笔记需要模拟，模拟 Galaxy 来自[galaxybook_mask](https://github.com/kellwinr/galaxybook_mask)。