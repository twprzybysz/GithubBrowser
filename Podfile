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
  pod 'Kingfisher'
  pod 'SVProgressHUD'
  pod 'R.swift', '~> 5.0'
  pod 'SwiftLint', '~> 0.38'
end

def testing_libraries
  pod 'Quick', '~> 2.2'
  pod 'Nimble', '~> 8.0'
  pod 'SnapshotTesting', '~> 1.6'
  pod 'Sourcery', '~> 0.17.0'
end


target 'GithubBrowser' do
  inhibit_all_warnings!
  use_frameworks!

  libraries
  target 'GithubBrowserTests' do
    inherit! :search_paths

    testing_libraries
  end
end

