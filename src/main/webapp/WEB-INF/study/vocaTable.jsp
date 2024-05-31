<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table Layout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .controls {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }
        .controls button {
            width: 30px;
            height: 30px;
            border: none;
            border-radius: 50%;
            cursor: pointer;
        }
        .controls .add-btn {
            background-color: #a3c0ff;
            color: white;
        }
        .controls .remove-btn {
            background-color: #ff7272;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td, th {
            border: 1px solid #ccc;
            padding: 10px;
        }
        input[type="text"] {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
        }
        .right-cell input {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="controls">
            <button class="add-btn">+</button>
            <input type="text" placeholder="come">
            <button class="remove-btn">-</button>
        </div>
        <table>
            <tr>
                <td>002</td>
                <td><input type="text" placeholder="동.은다"></td>
                <td><input type="text" placeholder="He is {coming} back."></td>
            </tr>
            <tr>
                <td>003</td>
                <td><input type="text"></td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td>004</td>
                <td><input type="text"></td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td>005</td>
                <td><input type="text"></td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td>006</td>
                <td><input type="text"></td>
                <td><input type="text"></td>
            </tr>
        </table>
        
        
          <table>
            <tr>
              <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
              <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
            </tr>
            <tr>
              <td colspan="2"><input type="text" name="examples[]" class="example-input" placeholder="예문"></td>
            </tr>
	        </table>
        
        
        
    </div>
</body>
</html>