//
//  ViewController.swift
//  AdTesting
//
//  Created by Venkatachalam P on 1/20/16.
//  Copyright © 2016 Venkatachalam P. All rights reserved.
//

import UIKit
import mopub_ios_sdk

import GoogleMobileAds

class ViewController: UIViewController, MPAdViewDelegate {
    let MoPubAdUnitID = "c8d7b377ea634307a3c980746893c839"
        var adView: MPAdView?
//    var adView2: MPGoogleAdMobBannerCustomEvent?
    var bannerView: GADBannerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addBannerViewInMyCast()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        adView?.startAutomaticallyRefreshingContents()
    }
    
    func adGoogleAdMob() {

        bannerView = GADBannerView()

        bannerView?.frame = CGRectMake(0,self.view.bounds.size.height-50, self.view.bounds.size.width, 50)
        view?.addSubview(bannerView!)

        bannerView!.adUnitID = "ca-app-pub-4379810185355305/3578000875"
    
        bannerView!.rootViewController = self
        bannerView!.loadRequest(GADRequest())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    func addGoogleAdMob() {
//        let size = CGSize(width: self.view.bounds.size.width, height: 50)
//        adView2 =
//        adView2?.delegate = self
//        adView2?.frame = CGRectMake(0,self.view.bounds.size.height-50, self.view.bounds.size.width, 50)
//        view?.addSubview(adView2!)
//        adView2?.loadAd()
//    }
    
    func addBannerViewInMyCast() {
        let size = CGSize(width: self.view.bounds.size.width, height: 50)
        adView = MPAdView(adUnitId: MoPubAdUnitID, size: size)
        adView?.delegate = self
            adView?.keywords = "m_age:24,m_gender:m,m_marital:single,dispcline:fish";
        adView?.frame = CGRectMake(0,self.view.bounds.size.height-50, self.view.bounds.size.width, 50)
        view?.addSubview(adView!)
        adView?.loadAd()
    }

    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }
    
    func adViewDidLoadAd(view: MPAdView!) {
        //        CGSize size = [view adContentViewSize];
        //        CGFloat centeredX = (self.view.bounds.size.width - size.width) / 2;
        //        CGFloat bottomAlignedY = self.view.bounds.size.height - size.height;
        //        view.frame = CGRectMake(centeredX, bottomAlignedY, size.width, size.height);
        let size = view.adContentViewSize()
        print("size of AdVertisement \(size)")
        let centeredX = (self.view.bounds.size.width - size.width)/2
        let bottomAlignedY = (self.view.bounds.size.height - size.height)
        print("size of bottomAlignedY \(bottomAlignedY)")
        view.frame = CGRectMake(0, bottomAlignedY,378, size.height)
    }
    
    func adViewDidFailToLoadAd(view: MPAdView!) {
        
    }


}

