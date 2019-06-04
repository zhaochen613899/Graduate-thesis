# coding=utf-8
import xlrd
import numpy
import cmath
import sympy
import matplotlib.pyplot as plt


def GetSimplificatedLines(deforms, loads):
    maxLoad = 0
    index = 0
    maxLoadIndex = 0
    for load in loads:
        index += 1
        if load > maxLoad:
            maxLoad = load
            maxLoadIndex = index

    loads = loads[0:maxLoadIndex - 1]
    deforms = deforms[0:maxLoadIndex - 1]

    Area = 0
    for i in range(1, len(loads)):
        load = loads[i]
        Area += load * (deforms[i] - deforms[i - 1])

    centerLoad = 0.6 * maxLoad
    index = 0
    for load in loads:
        if load > centerLoad:
            centerLoadReal = load
            break
        index += 1
    centerDeformReal = deforms[index]

    k = centerLoadReal / centerDeformReal

    deltaX = sympy.Symbol('deltaX')
    resDeltaX = sympy.solve((deltaX + centerDeformReal) * (k * deltaX + centerLoadReal) / 2 + (k * deltaX + centerLoadReal + maxLoad) * (deforms[-1] - deltaX - centerDeformReal) / 2 - Area, deltaX)[0]
    print(resDeltaX + centerDeformReal)

    plt.plot(deforms, loads)
    plt.plot([0, resDeltaX + centerDeformReal, deforms[-1]], [0, centerLoadReal + resDeltaX * k, loads[-1]])
    plt.show()


xlsFile = xlrd.open_workbook(r'!力位移曲线汇总.xlsx')
AllSheets = xlsFile.sheets()
all_specimen_groups = {}
colLoad = 8
colDeform = 10
startRow = 1

for sheet in AllSheets:
    if "-" in sheet.name:
        loads = []
        deforms = []
        max_row = sheet.nrows
        for row in range(startRow, max_row):
            loadValue = sheet.cell_value(row, colLoad)
            deformValue = sheet.cell_value(row, colDeform)
            if loadValue == "":
                break
            loads.append(loadValue)
            deforms.append(deformValue)
        print(sheet.name)
        GetSimplificatedLines(deforms, loads)
