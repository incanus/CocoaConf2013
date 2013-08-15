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
@property CLGeocoder *geocoder;

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

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.mapView addGestureRecognizer:longPress];
}

# pragma mark -

- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        [self.geocoder cancelGeocode];
        [self.mapView removeAnnotations:self.mapView.annotations];

        MKPointAnnotation *point = [MKPointAnnotation new];
        point.coordinate = [self.mapView convertPoint:[longPress locationInView:self.mapView] toCoordinateFromView:self.mapView];
        point.title = @"Dropped Pin";

        [self.mapView addAnnotation:point];

        self.geocoder = [CLGeocoder new];
        [self.geocoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:point.coordinate.latitude longitude:point.coordinate.longitude]
                            completionHandler:^(NSArray *placemarks, NSError *error)
                            {
                                CLPlacemark *placemark = placemarks.firstObject;

                                point.subtitle = [NSString stringWithFormat:@"%@, %@", placemark.locality, placemark.administrativeArea];
                            }];
    }
}

@end
