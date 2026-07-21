$src = "C:\Users\tranv\Downloads\img_B_extracted\word\media"
$dst = "C:\Users\tranv\OneDrive\Documents\TaiLieuHocTap\fcj-workshop-template-main\static\images\5-Workshop"

# Create directories if not exist
$dirs = @(
    "$dst\5.4-EC2-ASG\5.4.3",
    "$dst\5.5-CICD\5.5.1",
    "$dst\5.5-CICD\5.5.2",
    "$dst\5.5-CICD\5.5.3",
    "$dst\5.6-Async\5.6.1",
    "$dst\5.6-Async\5.6.2"
)
foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

# 5.4.3
Copy-Item "$src\image4.png" "$dst\5.4-EC2-ASG\5.4.3\img8.png" -Force
Copy-Item "$src\image4.png" "$dst\5.4-EC2-ASG\5.4.3\img9.png" -Force
Copy-Item "$src\image4.png" "$dst\5.4-EC2-ASG\5.4.3\img10.png" -Force
Copy-Item "$src\image6.png" "$dst\5.4-EC2-ASG\5.4.3\img11.png" -Force
Copy-Item "$src\image6.png" "$dst\5.4-EC2-ASG\5.4.3\img12.png" -Force
Copy-Item "$src\image7.png" "$dst\5.4-EC2-ASG\5.4.3\img13.png" -Force
Copy-Item "$src\image8.png" "$dst\5.4-EC2-ASG\5.4.3\img14.png" -Force
Copy-Item "$src\image6.png" "$dst\5.4-EC2-ASG\5.4.3\img15.png" -Force

# 5.5.1
Copy-Item "$src\image9.png" "$dst\5.5-CICD\5.5.1\img15.png" -Force
Copy-Item "$src\image10.png" "$dst\5.5-CICD\5.5.1\img16.png" -Force
Copy-Item "$src\image11.png" "$dst\5.5-CICD\5.5.1\img17.png" -Force
Copy-Item "$src\image12.png" "$dst\5.5-CICD\5.5.1\img18.png" -Force
Copy-Item "$src\image13.png" "$dst\5.5-CICD\5.5.1\img19.png" -Force
Copy-Item "$src\image32.png" "$dst\5.5-CICD\5.5.1\img20.png" -Force

# 5.5.2
Copy-Item "$src\image25.png" "$dst\5.5-CICD\5.5.2\img21.png" -Force

# 5.5.3
Copy-Item "$src\image23.png" "$dst\5.5-CICD\5.5.3\img28.png" -Force
Copy-Item "$src\image26.png" "$dst\5.5-CICD\5.5.3\img29.png" -Force
Copy-Item "$src\image27.png" "$dst\5.5-CICD\5.5.3\img30.png" -Force
Copy-Item "$src\image28.png" "$dst\5.5-CICD\5.5.3\img31.png" -Force
Copy-Item "$src\image18.png" "$dst\5.5-CICD\5.5.3\img32.png" -Force
Copy-Item "$src\image29.png" "$dst\5.5-CICD\5.5.3\img33.png" -Force

# 5.6.1
Copy-Item "$src\image30.png" "$dst\5.6-Async\5.6.1\img34.png" -Force
Copy-Item "$src\image37.png" "$dst\5.6-Async\5.6.1\img35.png" -Force
Copy-Item "$src\image33.png" "$dst\5.6-Async\5.6.1\img36.png" -Force

# 5.6.2
Copy-Item "$src\image36.png" "$dst\5.6-Async\5.6.2\img37.png" -Force

