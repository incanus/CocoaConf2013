//
//  MBXViewController.m
//  CocoaConf
//
//  Created by Justin R. Miller on 8/14/13.
//  Copyright (c) 2013 MapBox. All rights reserved.
//

#import "MBXViewController.h"

@interface MBXViewController ()

@property MKMapView *mapView;

@end

#pragma mark -

@implementation MBXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];

    CLLocationCoordinate2D coordinates[24] = {
        CLLocationCoordinate2DMake(45.580308679856756, -122.57248342037201),
        CLLocationCoordinate2DMake(45.580250483470145, -122.57252365350723),
        CLLocationCoordinate2DMake(45.58028615223038,  -122.57262557744978),
        CLLocationCoordinate2DMake(45.58022420121124,  -122.57266312837599),
        CLLocationCoordinate2DMake(45.58020542816163,  -122.57261484861374),
        CLLocationCoordinate2DMake(45.579935095551406, -122.57283478975297),
        CLLocationCoordinate2DMake(45.57983747512228,  -122.57260411977768),
        CLLocationCoordinate2DMake(45.579694798805185, -122.57271140813829),
        CLLocationCoordinate2DMake(45.57959717795827,  -122.57245659828185),
        CLLocationCoordinate2DMake(45.579741731844244, -122.57235735654831),
        CLLocationCoordinate2DMake(45.57970794006006,  -122.57226079702376),
        CLLocationCoordinate2DMake(45.57963660178227,  -122.57224470376968),
        CLLocationCoordinate2DMake(45.579281786369826, -122.5725182890892),
        CLLocationCoordinate2DMake(45.579246116971525, -122.57242977619173),
        CLLocationCoordinate2DMake(45.579169146087466, -122.57248878479004),
        CLLocationCoordinate2DMake(45.57907903369888,  -122.57225006818771),
        CLLocationCoordinate2DMake(45.57915037268509,  -122.57218569517134),
        CLLocationCoordinate2DMake(45.57912033522827,  -122.57208913564682),
        CLLocationCoordinate2DMake(45.5795126982422,   -122.57179141044617),
        CLLocationCoordinate2DMake(45.57957840469902,  -122.57195502519608),
        CLLocationCoordinate2DMake(45.57968165754721,  -122.57187455892563),
        CLLocationCoordinate2DMake(45.57962346051065,  -122.5717082619667),
        CLLocationCoordinate2DMake(45.57991444509016,  -122.57147490978241),
        CLLocationCoordinate2DMake(45.580308679856756, -122.57248342037201),
    };

    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:coordinates count:24];

    [self.mapView addOverlay:polygon];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    MKPolygon *polygon = (MKPolygon *)self.mapView.overlays.firstObject;

    [self.mapView setVisibleMapRect:polygon.boundingMapRect animated:YES];
}

#pragma mark -

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    MKPolygonView *polygonView = [[MKPolygonView alloc] initWithPolygon:overlay];
    polygonView.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cocoaconf.png"]];
    polygonView.strokeColor = [UIColor purpleColor];
    polygonView.lineWidth = 10.0;

    return polygonView;
}

@end
