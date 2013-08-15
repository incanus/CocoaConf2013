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

    MKPointAnnotation *point = [MKPointAnnotation new];
    point.coordinate = CLLocationCoordinate2DMake(45.580308679856756, -122.57248342037201);
    point.title = @"CocoaConf '13";
    point.subtitle = @"Embassy Suites";

    [self.mapView addAnnotation:point];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    MKPointAnnotation *point = self.mapView.annotations.firstObject;

    MKCoordinateRegion region = {
        .center = point.coordinate,
        .span = {
            .latitudeDelta  = 0.01,
            .longitudeDelta = 0.01,
        }
    };

    [self.mapView setRegion:region animated:YES];
}

#pragma -

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];
    annotationView.image = [UIImage imageNamed:@"mug.png"];

    return annotationView;
}

@end
