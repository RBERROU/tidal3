// Ensure you include Chart.js in your application if it's not already included
import Chart from 'chart.js/auto';

document.addEventListener("DOMContentLoaded", function() {
  const ctx = document.getElementById('challengesChart').getContext('2d');
  
  const data = {
    datasets: [{
      label: 'Sustainability Challenges',
      data: [
        <% @challenges.each do |challenge| %>
          {
            x: <%= challenge.average_financial_materiality %>,
            y: <%= challenge.average_impact_materiality %>,
            label: "<%= j challenge.name %>",
            backgroundColor: 'rgba(75, 192, 192, 0.6)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            radius: 5,  // Adjust the size of the points
          },
        <% end %>
      ],
      pointStyle: 'circle',
      pointRadius: 7, // Adjust the size of the points
      pointHoverRadius: 10, // Size of the point when hovered
    }]
  };

  const config = {
    type: 'scatter',
    data: data,
    options: {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        x: {
          title: {
            display: true,
            text: 'Financial Materiality'
          },
          beginAtZero: true,
          min: 0,
          max: 10,
        },
        y: {
          title: {
            display: true,
            text: 'Impact Materiality'
          },
          beginAtZero: true,
          min: 0,
          max: 10,
        }
      },
      plugins: {
        tooltip: {
          callbacks: {
            label: function(context) {
              const label = context.raw.label || '';
              return `${label}: (${context.raw.x}, ${context.raw.y})`;
            }
          }
        },
        legend: {
          display: false // Hide legend if not needed
        },
        datalabels: {
          display: true,
          color: 'black',
          anchor: 'end',
          align: 'top',
          formatter: (value) => value.label
        }
      }
    }
  };

  new Chart(ctx, config);
});
