<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Data</title>
    <!-- Optional Bootstrap for styling (e.g., text-danger) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <table class="table">
        <thead>
            <tr>
                <th>Bus Name</th>
                <th>Some Other Property</th>
                <th>Another Property</th>
                <th>Some Boolean Property</th>
            </tr>
        </thead>
        <tbody id="busTableBody">
            <!-- Rows will be dynamically inserted here -->
        </tbody>
    </table>

    <script>
        // Example data array for buses, including some false values
        var data = [
            { busName: 'City Bus 1', someOtherProperty: 'Value 1', anotherProperty: 'Extra 1', someBooleanProperty: true },
            { busName: 'City Bus 2', someOtherProperty: 'Value 2', anotherProperty: 'Extra 2', someBooleanProperty: false },
            { busName: '', someOtherProperty: 'Value 3', anotherProperty: 'Extra 3', someBooleanProperty: false }, // Example with false value
            { busName: 'City Bus 4', someOtherProperty: 'Value 4', anotherProperty: 'Extra 4', someBooleanProperty: null }
        ];

        // JavaScript code to loop through `data` and create rows dynamically
        data.forEach(function(bus) {
            var busName = bus.busName || 'N/A';  // Default to 'N/A' if busName is falsy
            var row = `
                <tr class="align-middle">
                    <td class="text-danger">${busName}</td>
                    <td>${bus.someOtherProperty !== undefined ? bus.someOtherProperty : 'N/A'}</td>
                    <td>${bus.anotherProperty !== undefined ? bus.anotherProperty : 'N/A'}</td>
                    <td>${bus.someBooleanProperty === false ? 'false' : bus.someBooleanProperty}</td>
                </tr>
            `;
            document.getElementById('busTableBody').innerHTML += row;
        });
    </script>

</body>
</html>
