//
//  ViewController.m
//  CollectionView
//
//  Created by huweiya on 16/4/13.
//  Copyright © 2016年 bj_5i5j. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"


#define WIDTH1 [UIScreen mainScreen].bounds.size.width
#define HEIGHT1 [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *HU_CollectionView;
}


@property (nonatomic , strong) UICollectionView *myCollectionView;
@end




@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置单元格的尺寸
    flowLayout.itemSize = CGSizeMake(WIDTH1, 180);
    
    //设置最小 最大间距
    
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    
    
    //设置头视图高度
    flowLayout.headerReferenceSize = CGSizeMake(0, 0);
    //flowlaout的属性，横向滑动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    //接下来就在创建collectionView的时候初始化，就很方便了（能直接带上layout）
    _myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH1, 180) collectionViewLayout:flowLayout];
    
    _myCollectionView.pagingEnabled = YES;
    
    _myCollectionView.tag = 200;
    _myCollectionView.backgroundColor = [UIColor greenColor]; _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    
    //添加到主页面上去
    [self.view addSubview:_myCollectionView];
    //collectionCell的注册
    
    //从xib注册
    [_myCollectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"hehe"] ;
    
    
    
    //自定义注册
    
//    [_myCollectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

    
    
    
    //collection头视图的注册   奇葩的地方来了，头视图也得注册
    [_myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Identifierhead"];
}



//指定组的个数 ，一个大组！！不是一排，是N多排组成的一个大组(与下面区分)
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


//指定单元格的个数 ，这个是一个组里面有多少单元格，e.g : 一个单元格就是一张图片
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hehe" forIndexPath:indexPath];
    
    NSLog(@"%ld",indexPath.row);
    
    cell.backgroundColor = [UIColor colorWithRed:(arc4random() % 10) * 0.1 green:(arc4random() % 10) * 0.1 blue:(arc4random() % 10) * 0.1 alpha:1.0];
    

    
    return cell;
    
}


//组的头视图创建
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Identifierhead" forIndexPath:indexPath];
    headView.backgroundColor = [UIColor redColor];
    return headView;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
