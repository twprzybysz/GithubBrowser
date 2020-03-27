platform :ios, '11.0'

plugin 'cocoapods-keys', {
  :project => "GithubBrowser",
  :keys => [
    "GithubClientId",
    "GithubClientSecret"
  ]}


def libraries
  pod 'SnapKit', '~> 5.0'
  pod 'Swinject'
  pod 'SwinjectAutoregistration'
  pod 'Alamofire'
  pod 'Kingfisher'
  pod 'SVProgressHUD'
  pod 'R.swift', '~> 5.0'
  pod 'SwiftLint', '~> 0.38'
end

target 'GithubBrowser' do
  inhibit_all_warnings!
  use_frameworks!

  libraries
end

