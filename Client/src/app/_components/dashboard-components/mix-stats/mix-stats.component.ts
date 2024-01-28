import { Component, ViewChild } from '@angular/core';

import {
  ApexChart,
  ChartComponent,
  ApexDataLabels,
  ApexLegend,
  ApexTooltip,
  ApexAxisChartSeries,
  ApexNonAxisChartSeries,
  ApexTheme,
  ApexXAxis,
  ApexYAxis,
  ApexGrid,
  ApexFill,
  ApexStroke,
  ApexPlotOptions,
  NgApexchartsModule,
} from 'ng-apexcharts';

// interface 1
export type totalvisitsChartOptions = {
  series: ApexAxisChartSeries | any;
  chart: ApexChart | any;
  xaxis: ApexXAxis | any;
  yaxis: ApexYAxis | any;
  stroke: any;
  theme: ApexTheme | any;
  tooltip: ApexTooltip | any;
  dataLabels: ApexDataLabels | any;
  legend: ApexLegend | any;
  colors: string[] | any;
  markers: any;
  grid: ApexGrid | any;
  fill: ApexFill | any;
};

// interface 2
export type salesratioChartOptions = {
  series: ApexAxisChartSeries | any;
  chart: ApexChart | any;
  xaxis: ApexXAxis | any;
  yaxis: ApexYAxis | any;
  stroke: any;
  theme: ApexTheme | any;
  tooltip: ApexTooltip | any;
  dataLabels: ApexDataLabels | any;
  legend: ApexLegend | any;
  colors: string[] | any;
  markers: any;
  grid: ApexGrid | any;
};

// interface 3
export interface orderstatsChartOptions {
  series: ApexNonAxisChartSeries | any;
  chart: ApexChart | any;
  stroke: ApexStroke | any;
  dataLabels: ApexDataLabels | any;
  legends: ApexLegend | any;
  labels: any;
  name: any;
  tooltip: ApexTooltip | any;
  colors: string[] | any;
  plotOptions: ApexPlotOptions | any;
}

@Component({
  selector: 'app-mix-stats',
  standalone: true,
  imports: [NgApexchartsModule],
  templateUrl: './mix-stats.component.html',
  styleUrls: ['./mix-stats.component.css'],
})
export class MixstatsComponent {
  @ViewChild('chart') chart: ChartComponent = Object.create(null);
  public totalvisitsChartOptions: Partial<totalvisitsChartOptions>;

  @ViewChild('chart') chart2: ChartComponent = Object.create(null);
  public salesratioChartOptions: Partial<salesratioChartOptions>;

  @ViewChild('chart') chart3: ChartComponent = Object.create(null);
  public orderstatsChartOptions: Partial<orderstatsChartOptions>;

  constructor() {
    // 1
    this.totalvisitsChartOptions = {
      series: [
        {
          name: 'Earnings',
          data: [6, 10, 9, 11, 9, 10, 12, 10, 9, 11, 9, 10, 12, 10],
        },
      ],
      chart: {
        height: 70,
        type: 'bar',
        fontFamily: 'Nunito Sans,sans-serif',
        toolbar: {
          show: false,
        },
        sparkline: {
          enabled: true,
        },
      },
      dataLabels: {
        enabled: false,
      },
      markers: {
        size: 0,
      },
      fill: {
        colors: ['#4fc3f7'],
        opacity: 1,
      },
      stroke: {
        show: true,
        width: 7,
        colors: ['transparent'],
      },
      legend: {
        show: false,
      },
      grid: {
        show: false,
      },
      xaxis: {
        labels: {
          show: false,
        },
      },
      yaxis: {
        labels: {
          show: false,
        },
      },
      tooltip: {
        theme: 'dark',
        x: {
          show: false,
        },
      },
    };

    // 2
    this.salesratioChartOptions = {
      series: [
        {
          name: 'sales ratio',
          data: [5, 6, 3, 7, 9, 10, 14, 12, 11, 9, 8, 7, 10, 6, 12, 10, 8],
        },
      ],
      chart: {
        height: 70,
        type: 'area',
        fontFamily: 'Nunito Sans,sans-serif',
        toolbar: {
          show: false,
        },
        sparkline: {
          enabled: true,
        },
      },
      dataLabels: {
        enabled: false,
      },
      markers: {
        size: 0,
      },
      stroke: {
        curve: 'smooth',
        width: '2',
      },
      colors: ['#2961ff'],
      legend: {
        show: false,
      },
      grid: {
        show: false,
      },
      xaxis: {
        labels: {
          show: false,
        },
      },
      yaxis: {
        labels: {
          show: false,
        },
      },
      tooltip: {
        theme: 'dark',
      },
    };

    // 3
    this.orderstatsChartOptions = {
      series: [45, 15, 27],
      chart: {
        fontFamily: 'Nunito Sans,sans-serif',
        type: 'donut',
        height: 135,
      },
      plotOptions: {
        pie: {
          donut: {
            size: '60px',
            labels: {
              show: true,
              name: {
                show: true,
                fontSize: '18px',
                color: undefined,
                offsetY: 0,
              },
              value: {
                show: false,
                color: '#99abb4',
              },
              total: {
                show: true,
                label: '75%',
                color: '#99abb4',
              },
            },
          },
        },
      },
      tooltip: {
        fillSeriesColor: false,
      },
      dataLabels: {
        enabled: false,
      },
      stroke: {
        width: 0,
      },
      legends: {
        show: false,
      },
      labels: ['Success', 'Failed', 'Pending'],
      colors: ['#40c4ff', '#2961ff', '#ff821c'],
    };
  }
}
