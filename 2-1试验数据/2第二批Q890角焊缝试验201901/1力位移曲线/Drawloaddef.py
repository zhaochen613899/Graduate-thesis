import os
import shutil

import matplotlib
import xlrd
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties

matplotlib.matplotlib_fname()
plt.rcParams['font.sans-serif'] = ['SimHei']  # 解决中文显示问题，目前只知道黑体可行
plt.rcParams['axes.unicode_minus'] = False  # 解决负数坐标显示问题
font_zh = {'family': 'SimHei', 'size': 12}
font_en = {'family': 'Times New Roman', 'size': 12}

xlsFile = xlrd.open_workbook(r'力位移曲线最终版.xlsx')
AllSheets = xlsFile.sheets()
all_specimen_groups = {}
for sheet in AllSheets:
    print('Sheet:', sheet.name)
    max_row = sheet.nrows
    specimen_group = {}
    for j in range(6):
        col_offset = 5 * j
        specimen = {}
        specimen_name = sheet.cell_value(0, 0 + col_offset)
        for col in range(1 + col_offset, 5 + col_offset):
            col_name = sheet.cell_value(0, col)
            data = sheet.col_values(col, 1, max_row + 1)
            need_data = []
            for d in data:
                if d == "":
                    pass
                else:
                    need_data.append(d)
            specimen[col_name] = need_data
        specimen_group[specimen_name] = specimen
    all_specimen_groups[sheet.name] = specimen_group
pass

path = os.curdir + "/试件力位移曲线"
if os.path.exists(path):
    shutil.rmtree(path)
os.mkdir(path)

# 画每个试件=三条曲线
plt.rcParams["figure.figsize"] = [5, 5]
x_names = ["Deformation_B-A", "Deformation_B-C", "平均位移(mm)"]
y_name = "荷载(kN)"
colors = ["blue", "red", "green"]
linestyles = [":", "-.", "-"]
allSingle = path + "/所有试件"
if os.path.exists(allSingle):
    shutil.rmtree(allSingle)
os.mkdir(allSingle)
for sheetname in all_specimen_groups:
    specimen_group = all_specimen_groups[sheetname]
    for specimen_name in specimen_group:
        specimen = specimen_group[specimen_name]
        index = 0
        figure, ax = plt.subplots(figsize=(12, 8))
        for x_name in x_names:
            x_data = specimen[x_name]
            y_data = specimen[y_name]
            font_zh["size"] = 30
            plt.xlabel("位移(mm)", font_zh)  # X轴标签
            plt.ylabel(y_name, font_zh)  # Y轴标签
            plt.title(specimen_name, font_zh)  # 标题
            plt.tick_params(labelsize=30)
            labels = ax.get_xticklabels() + ax.get_yticklabels()
            [label.set_fontname('Times New Roman') for label in labels]
            plt.plot(x_data, y_data, color=colors[index], linestyle=linestyles[index], mfc='w', label=x_name)
            plt.legend(prop=font_zh)  # 让图例生效
            index = index + 1
        plt.savefig(allSingle + "/" + specimen_name + '.png')
        plt.show()

# 画单组试件=六条曲线
plt.rcParams["figure.figsize"] = [7, 5]
x_name = "平均位移(mm)"
y_name = "荷载(kN)"
colors = ["blue", "red", "green", "blue", "red", "green"]
linestyles = [":", "--", ":", "-", ":", "-."]
group_path = path + "/" + "组试件的力位移曲线"
if os.path.exists(group_path):
    shutil.rmtree(group_path)
os.mkdir(group_path)
for sheetname in all_specimen_groups:
    specimen_group = all_specimen_groups[sheetname]
    index = 0
    figure, ax = plt.subplots(figsize=(12, 8))
    for specimen_name in specimen_group:
        specimen = specimen_group[specimen_name]
        x_data = specimen[x_name]
        y_data = specimen[y_name]
        plt.xlabel("位移(mm)", font_zh)  # X轴标签
        plt.ylabel(y_name, font_zh)  # Y轴标签
        plt.tick_params(labelsize=30)
        labels = ax.get_xticklabels() + ax.get_yticklabels()
        [label.set_fontname('Times New Roman') for label in labels]
        plt.title(sheetname + "°试件力位移曲线", font_zh)  # 标题
        plt.plot(x_data, y_data, mfc='w', color=colors[index], linestyle=linestyles[index], label=specimen_name)
        plt.legend(prop=font_zh)  # 让图例生效
        index = index + 1
    plt.savefig(group_path + "/" + sheetname + '.png')
    plt.show()
