import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player: Player!
    var base: Base!
    var message: SKSpriteNode!
    
    var isStart = false
    var isEnd = false
    
    let hitSound = SKAction.playSoundFileNamed("hit", waitForCompletion: false)
    let pointSound = SKAction.playSoundFileNamed("point", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        configureStartScene()
    }
    
    func configureStartScene() {
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.scale(to: CGSize(width: 1536, height: 2048))
        background.zPosition = -2
        
        addChild(background)
        
        player = Player().spawn(at: CGPoint(x: size.width / 2, y: size.height / 2 ))
        self.addChild(player)
        
        base = Base().spawn(at: CGPoint(x: size.width/2, y: 0 ))
        self.addChild(base)
        
        message = SKSpriteNode(imageNamed: "message")
        message.position = CGPoint(x: size.width / 2, y: size.height / 2 + 180)
        message.setScale(4)
        self.addChild(message)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch (isStart, isEnd) {
        case (true, false):
            player.jump()
        case (false, false):
            isStart = true
            player.gameStarted()
            message.removeFromParent()
            
            let spawn = SKAction.run {
                self.spawnWall()
            }
            
            let delay = SKAction.wait(forDuration: 1)
            let SpawnDelay = SKAction.sequence([spawn, delay])
            let spawnDelayForever = SKAction.repeatForever(SpawnDelay)
            self.run(spawnDelayForever)
            
        case (_, true):
            restartScene()
        }
    }
    
    func restartScene() {
        self.removeAllChildren()
        self.removeAllActions()
        
        isStart = false
        isEnd = false
        
        configureStartScene()
    }
    
    func spawnWall() {
        let wall = WallPair.spawn(at: CGPoint(x: size.width + 50, y: size.height / 2 ))
        
        self.addChild(wall)
        
        let wallMove = SKAction.move(to: CGPoint(x: -size.width, y: wall.position.y), duration: 2)
        let removeWall = SKAction.removeFromParent()
        let wallActions = SKAction.sequence([wallMove, removeWall])
        
        wall.run(wallActions, withKey: "wallAnimations")
    }
}
