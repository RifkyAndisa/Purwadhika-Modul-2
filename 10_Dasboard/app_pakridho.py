# Flask : library utama untuk membuat API
# render_template : agar dapat memberikan respon file html
# request : untuk membaca data yang diterima saat request datang
from flask import Flask, render_template, request

# plotly dan plotly.graph_objs : membuat plot
import plotly
import plotly.graph_objs as go

# pandas : untuk membaca csv dan men-generate dataframe
import pandas as pd
import json

# object Flask
app = Flask(__name__)

# import dataset
tips = pd.read_csv('./static/tips.csv')

# print(tips)
# conda install -c plotly plotly
# pip install plotly

def category_plot(
    cat_plot = 'histplot',
    cat_x = 'sex', cat_y = 'total_bill',
    estimator = 'count', hue = 'smoker'):

    # jika menu yang dipilih adalah histogram
    if cat_plot == 'histplot':
        # siapkan list kosong untuk menampung konfigurasi hist
        data = []
        # generate config histogram dengan mengatur sumbu x dan sumbu y
        for val in tips[hue].unique():
            hist = go.Histogram(
                x=tips[tips[hue]==val][cat_x],
                y=tips[tips[hue]==val][cat_y],
                histfunc=estimator,
                name=val
            )
            # masukkan dalam array
            data.append(hist)
        
        title = 'Histogram'

    elif cat_plot == 'boxplot':
        data = []
        
        for val in tips[hue].unique():
            box = go.Box(
                x=tips[tips[hue]==val][cat_x],
                y=tips[tips[hue]==val][cat_y],
                name=val
            )
            # masukkan dalam array
            data.append(box)
        
        title = 'Box'

    #menyiapkan config layout tempat plot ditampilkan
    if cat_plot == 'histplot' and estimator == 'count':
        layout = go.Layout(
            title=title,
            xaxis=dict(title=cat_x),
            yaxis=dict(title='person'),
            # boxmode group berfungsi untuk mengelompokkan box berdasarkan hue
            boxmode='group'
        )
    else:
        layout = go.Layout(
            title=title,
            xaxis=dict(title=cat_x),
            yaxis=dict(title=cat_y),
            # boxmode group berfungsi untuk mengelompokkan box berdasarkan hue
            boxmode='group'
        )

    # simpan config plot dan layout dalam dict
    result = {'data': data, 'layout': layout}

    graphJSON = json.dumps(result, cls=plotly.utils.PlotlyJSONEncoder)

    return graphJSON
    

@app.route('/')
def home():

    plot = category_plot()

    list_plot = [('histplot', 'Histogram'), ('boxplot', 'Box')]
    list_x = [('sex', 'Sex'), ('smoker', 'Smoker'), ('day', 'Day'), ('time', 'Time')]
    list_y = [('total_bill', 'Bill'), ('tip', 'Tip'), ('size', 'Size')]
    list_est = [('count', 'Count'), ('avg', 'Average'), ('max', 'Max'), ('min', 'Min')]
    list_hue = [('sex', 'Sex'), ('smoker', 'Smoker'), ('day', 'Day'), ('time', 'Time')]

    return render_template(
        'category.html',
        # plot yang akan ditampilkan,
        plot=plot,
        # menu yang akan ditampilkan di dropdown "Jenis Plot"
        focus_plot='histplot',
        # menu yang akan ditampilkan di dropdown 'Sumbu X'
        focus_x = 'sex',

        # untuk sumbu Y tidak ada, nantinya menu dropdown Y akan di disable
        # karena pada histogram, sumbu Y akan menunjukkan kuantitas/frekuensi data

        # menu yang akan muncul di dropwodn 'Estimator'
        focus_estimator='count',

        # menu yang akan muncul di dropdown 'Hue'
        focus_hue='smoker',

        # list yang akan digunakan looping untuk membuat dropdown 'Jenis Plot'
        drop_plot=list_plot,

        # list yang akan digunakan looping untuk membuat dropdown 'Sumbu X'
        drop_x=list_x,

        # list yang akan digunakan looping untuk membuat dropdown 'Sumbu Y'
        drop_y=list_y,

        # list yang akan digunakan looping untuk membuat dropdown 'Estimator'
        drop_estimator=list_est,

        # list yang akan digunakan looping untuk membuat dropdown 'Hue'
        drop_hue=list_hue
    )

@app.route('/cat_fn/<nav>')
def cat_fn(nav):
    
    if nav == 'True':
        cat_plot = 'histplot'
        cat_x = 'sex'
        cat_y = 'total_bill'
        estimator = 'count'
        hue = 'smoker'

    else:
        cat_plot = request.args.get('cat_plot')
        cat_x = request.args.get('cat_x')
        cat_y = request.args.get('cat_y')
        estimator = request.args.get('estimator')
        hue = request.args.get('hue')

    # Dari boxplot ke histogram akan None
    if estimator == None:
        estimator = 'count'

    # Saat estimator == 'count', dropdown menu sumbu Y menjadi disabled dan memberikan nilai None
    if cat_y == None:
        cat_y = 'total_bill'

    # dropdown menu
    list_plot = [('histplot', 'Histogram'), ('boxplot', 'Box')]
    list_x = [('sex', 'Sex'), ('smoker', 'Smoker'), ('day', 'Day'), ('time', 'Time')]
    list_y = [('total_bill', 'Bill'), ('tip', 'Tip'), ('size', 'Size')]
    list_est = [('count', 'Count'), ('avg', 'Average'), ('max', 'Max'), ('min', 'Min')]
    list_hue = [('sex', 'Sex'), ('smoker', 'Smoker'), ('day', 'Day'), ('time', 'Time')]

    plot = category_plot(cat_plot, cat_x, cat_y, estimator, hue)
    return render_template(
        'category.html',
        # plot yang akan ditampilkan,
        plot=plot,
        # menu yang akan ditampilkan di dropdown "Jenis Plot"
        focus_plot=cat_plot,
        # menu yang akan ditampilkan di dropdown 'Sumbu X'
        focus_x = cat_x,

        focu_y = cat_y,
        # untuk sumbu Y tidak ada, nantinya menu dropdown Y akan di disable
        # karena pada histogram, sumbu Y akan menunjukkan kuantitas/frekuensi data

        # menu yang akan muncul di dropwodn 'Estimator'
        focus_estimator=estimator,

        # menu yang akan muncul di dropdown 'Hue'
        focus_hue=hue,

        # list yang akan digunakan looping untuk membuat dropdown 'Jenis Plot'
        drop_plot=list_plot,

        # list yang akan digunakan looping untuk membuat dropdown 'Sumbu X'
        drop_x=list_x,

        # list yang akan digunakan looping untuk membuat dropdown 'Sumbu Y'
        drop_y=list_y,

        # list yang akan digunakan looping untuk membuat dropdown 'Estimator'
        drop_estimator=list_est,

        # list yang akan digunakan looping untuk membuat dropdown 'Hue'
        drop_hue=list_hue
    )

def scatter_plot(cat_x, cat_y, hue):

    data = []

    for val in tips[hue].unique():
        scatt = go.Scatter(
            x = tips[tips[hue] == val][cat_x],
            y = tips[tips[hue] == val][cat_y],
            mode = 'markers',
            name = val
        )
        data.append(scatt)

    layout = go.Layout(
        title = 'Scatter',
        title_x = 0.5,
        xaxis=dict(title=cat_x),
        yaxis=dict(title=cat_y)
    )

    result = {"data": data, "layout": layout}

    graphJSON = json.dumps(result, cls=plotly.utils.PlotlyJSONEncoder)

    return graphJSON

@app.route('/scatt_fn')
def scatt_fn():
    
    cat_x = request.args.get('cat_x')
    cat_y = request.args.get('cat_y')
    hue = request.args.get('hue')

    # wajib! default value ketika scatter pertama kali dipanggil
    if cat_x == None and cat_y == None and hue == None:
        cat_x = 'total_bill'
        cat_y = 'tip'
        hue = 'sex'

    # Dropdown menu
    list_x = [('total_bill', 'Bill'), ('tip', 'Tip'), ('size', 'Size')]
    list_y = [('total_bill', 'Bill'), ('tip', 'Tip'), ('size', 'Size')]
    list_hue = [('sex', 'Sex'), ('smoker', 'Smoker'), ('day', 'Daytime'), ('time', 'Time')]

    plot = scatter_plot(cat_x, cat_y, hue)

    return render_template(
        'scatter.html',
        plot = plot,
        focus_x = cat_x,
        focus_y = cat_y,
        focus_hue = hue,
        drop_x = list_x,
        drop_y = list_y,
        drop_hue = list_hue
    )

def pie_plot(hue = 'sex'):

    vcounts = tips[hue].value_counts()

    labels = []
    values = []

    for item in vcounts.iteritems():
        labels.append(item[0])
        values.append(item[1])

    data = [
        go.Pie(labels = labels, values = values)
    ]

    layout = go.Layout(title='Pie', title_x=0.48)

    result = {'data': data, 'layout': layout}

    graphJSON = json.dumps(result, cls=plotly.utils.PlotlyJSONEncoder)

    return graphJSON

@app.route('/pie_fn')
def pie_fn():
    hue = request.args.get('hue')

    if hue == None:
        hue = 'sex'

    list_hue = [('sex', 'Sex'), ('smoker', 'Smoker'), ('day', 'Day'), ('time', 'Time')]

    plot = pie_plot(hue)
    return render_template('pie.html', plot=plot, focus_hue=hue, drop_hue=list_hue)

@app.route('/db_fn')
def db_fn():
    pass

if __name__ == '__main__':
    app.run(debug=True, port=5000)