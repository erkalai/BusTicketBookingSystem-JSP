<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1X2 Seat Layout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Seat Layout Styles */
        .seat-column {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            gap: 10px;
        }

        .seat-row {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .seat-box {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 5px;
            width: 80px; /* Adjust width */
        }

        .seat-box input {
            margin-right: 5px;
        }

        .seat-box label {
            font-size: 1rem;
        }

        /* Regular Seat Style */
        .regular-seat {
            height: 40px;
            background-color: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Sleeper Seat Style (Taller height for sleeper seats) */
        .sleeper-seat {
            height: 60px;
            background-color: #d3d3d3;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .col {
                flex: 1;
                max-width: 33%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <!-- First Column -->
            <div class="col-lg-4 col-md-12 col-12">
                <div class="seat-column">
                    <!-- Regular Seats (S1 - S8) -->
                    <div class="seat-row">
                        <div class="seat-box regular-seat" data-seat="S1">
                            <input type="checkbox" id="seat1"> <label for="seat1">S1</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S2">
                            <input type="checkbox" id="seat2"> <label for="seat2">S2</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S3">
                            <input type="checkbox" id="seat3"> <label for="seat3">S3</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S4">
                            <input type="checkbox" id="seat4"> <label for="seat4">S4</label>
                        </div>
                    </div>
                    <div class="seat-row">
                        <div class="seat-box regular-seat" data-seat="S5">
                            <input type="checkbox" id="seat5"> <label for="seat5">S5</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S6">
                            <input type="checkbox" id="seat6"> <label for="seat6">S6</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S7">
                            <input type="checkbox" id="seat7"> <label for="seat7">S7</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S8">
                            <input type="checkbox" id="seat8"> <label for="seat8">S8</label>
                        </div>
                    </div>
                    <!-- Sleeper Seats (S9 - S12) -->
                    <div class="seat-row">
                        <div class="seat-box sleeper-seat" data-seat="S9">
                            <input type="checkbox" id="seat9"> <label for="seat9">S9</label>
                        </div>
                        <div class="seat-box sleeper-seat" data-seat="S10">
                            <input type="checkbox" id="seat10"> <label for="seat10">S10</label>
                        </div>
                    </div>
                    <div class="seat-row">
                        <div class="seat-box sleeper-seat" data-seat="S11">
                            <input type="checkbox" id="seat11"> <label for="seat11">S11</label>
                        </div>
                        <div class="seat-box sleeper-seat" data-seat="S12">
                            <input type="checkbox" id="seat12"> <label for="seat12">S12</label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Second Column -->
            <div class="col-lg-4 col-md-12 col-12">
                <div class="seat-column">
                    <!-- Regular Seats (S13 - S20) -->
                    <div class="seat-row">
                        <div class="seat-box regular-seat" data-seat="S13">
                            <input type="checkbox" id="seat13"> <label for="seat13">S13</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S14">
                            <input type="checkbox" id="seat14"> <label for="seat14">S14</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S15">
                            <input type="checkbox" id="seat15"> <label for="seat15">S15</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S16">
                            <input type="checkbox" id="seat16"> <label for="seat16">S16</label>
                        </div>
                    </div>
                    <div class="seat-row">
                        <div class="seat-box regular-seat" data-seat="S17">
                            <input type="checkbox" id="seat17"> <label for="seat17">S17</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S18">
                            <input type="checkbox" id="seat18"> <label for="seat18">S18</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S19">
                            <input type="checkbox" id="seat19"> <label for="seat19">S19</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S20">
                            <input type="checkbox" id="seat20"> <label for="seat20">S20</label>
                        </div>
                    </div>
                    <!-- Sleeper Seats (S21 - S24) -->
                    <div class="seat-row">
                        <div class="seat-box sleeper-seat" data-seat="S21">
                            <input type="checkbox" id="seat21"> <label for="seat21">S21</label>
                        </div>
                        <div class="seat-box sleeper-seat" data-seat="S22">
                            <input type="checkbox" id="seat22"> <label for="seat22">S22</label>
                        </div>
                    </div>
                    <div class="seat-row">
                        <div class="seat-box sleeper-seat" data-seat="S23">
                            <input type="checkbox" id="seat23"> <label for="seat23">S23</label>
                        </div>
                        <div class="seat-box sleeper-seat" data-seat="S24">
                            <input type="checkbox" id="seat24"> <label for="seat24">S24</label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Third Column -->
            <div class="col-lg-4 col-md-12 col-12">
                <div class="seat-column">
                    <!-- Regular Seats (S25 - S32) -->
                    <div class="seat-row">
                        <div class="seat-box regular-seat" data-seat="S25">
                            <input type="checkbox" id="seat25"> <label for="seat25">S25</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S26">
                            <input type="checkbox" id="seat26"> <label for="seat26">S26</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S27">
                            <input type="checkbox" id="seat27"> <label for="seat27">S27</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S28">
                            <input type="checkbox" id="seat28"> <label for="seat28">S28</label>
                        </div>
                    </div>
                    <div class="seat-row">
                        <div class="seat-box regular-seat" data-seat="S29">
                            <input type="checkbox" id="seat29"> <label for="seat29">S29</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S30">
                            <input type="checkbox" id="seat30"> <label for="seat30">S30</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S31">
                            <input type="checkbox" id="seat31"> <label for="seat31">S31</label>
                        </div>
                        <div class="seat-box regular-seat" data-seat="S32">
                            <input type="checkbox" id="seat32"> <label for="seat32">S32</label>
                        </div>
                    </div>
                    <!-- Sleeper Seats (S33 - S36) -->
                    <div class="seat-row">
                        <div class="seat-box sleeper-seat" data-seat="S33">
                            <input type="checkbox" id="seat33"> <label for="seat33">S33</label>
                        </div>
                        <div class="seat-box sleeper-seat" data-seat="S34">
                            <input type="checkbox" id="seat34"> <label for="seat34">S34</label>
                        </div>
                    </div>
                    <div class="seat-row">
                        <div class="seat-box sleeper-seat" data-seat="S35">
                            <input type="checkbox" id="seat35"> <label for="seat35">S35</label>
                        </div>
                        <div class="seat-box sleeper-seat" data-seat="S36">
                            <input type="checkbox" id="seat36"> <label for="seat36">S36</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
