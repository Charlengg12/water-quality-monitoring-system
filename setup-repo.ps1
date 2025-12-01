# PowerShell script to create GitHub repository and push code
# Usage: .\setup-repo.ps1 -RepoName "your-repo-name" -GitHubToken "your-token" (optional)

param(
    [string]$RepoName = "water-quality-monitoring-system",
    [string]$GitHubToken = "",
    [string]$GitHubUsername = "Charlengg12"
)

Write-Host "Setting up GitHub repository: $RepoName" -ForegroundColor Green

# If no token provided, guide user to create repo manually
if ([string]::IsNullOrEmpty($GitHubToken)) {
    Write-Host "`nTo create the repository, please follow these steps:" -ForegroundColor Yellow
    Write-Host "1. Go to https://github.com/new" -ForegroundColor Cyan
    Write-Host "2. Repository name: $RepoName" -ForegroundColor Cyan
    Write-Host "3. Set visibility (Public/Private)" -ForegroundColor Cyan
    Write-Host "4. DO NOT initialize with README, .gitignore, or license" -ForegroundColor Red
    Write-Host "5. Click 'Create repository'" -ForegroundColor Cyan
    Write-Host "`nAfter creating the repository, run these commands:" -ForegroundColor Yellow
    Write-Host "git remote add origin https://github.com/$GitHubUsername/$RepoName.git" -ForegroundColor White
    Write-Host "git branch -M main" -ForegroundColor White
    Write-Host "git push -u origin main" -ForegroundColor White
    exit
}

# Try to create repo via API
$headers = @{
    "Authorization" = "token $GitHubToken"
    "Accept" = "application/vnd.github.v3+json"
}

$body = @{
    name = $RepoName
    description = "Water Quality Testing & Monitoring System with ESP32 integration"
    private = $false
} | ConvertTo-Json

try {
    Write-Host "Creating repository on GitHub..." -ForegroundColor Yellow
    $response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $body -ContentType "application/json"
    Write-Host "Repository created successfully!" -ForegroundColor Green
    
    # Add remote and push
    Write-Host "Adding remote origin..." -ForegroundColor Yellow
    git remote add origin "https://github.com/$GitHubUsername/$RepoName.git"
    
    Write-Host "Renaming branch to main..." -ForegroundColor Yellow
    git branch -M main
    
    Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
    git push -u origin main
    
    Write-Host "`nSuccess! Repository is available at: $($response.html_url)" -ForegroundColor Green
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "You may need to create the repository manually on GitHub." -ForegroundColor Yellow
}

