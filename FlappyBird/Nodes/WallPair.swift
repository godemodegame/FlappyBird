import Foundation
import SpriteKit

class WallPair: SKNode {
    
    static func spawn(at point: CGPoint) -> WallPair {
        let wallPair = WallPair()
        wallPair.name = "wall"
        
        let topWall = SKSpriteNode(imageNamed: "greenwall")
        
        topWall.setScale(4)
        topWall.zRotation = .pi
        topWall.position = CGPoint(x: point.x, y: point.y + 150 + topWall.frame.height / 2)
        topWall.zPosition = -1
        
        topWall.physicsBody = SKPhysicsBody(texture: topWall.texture!, size: topWall.size)
        topWall.physicsBody?.isDynamic = false
        topWall.physicsBody?.categoryBitMask = BitMaskCategory.wall
        topWall.physicsBody?.collisionBitMask = BitMaskCategory.player
        topWall.physicsBody?.contactTestBitMask = BitMaskCategory.player
        
        wallPair.addChild(topWall)
        
        let bottomWall = SKSpriteNode(imageNamed: "greenwall")
        
        bottomWall.setScale(4)
        bottomWall.position = CGPoint(x: point.x, y: point.y - 150 - bottomWall.frame.height / 2)
        bottomWall.zPosition = -1
        
        bottomWall.physicsBody = SKPhysicsBody(texture: bottomWall.texture!, size: bottomWall.size)
        bottomWall.physicsBody?.isDynamic = false
        bottomWall.physicsBody?.categoryBitMask = BitMaskCategory.wall
        bottomWall.physicsBody?.collisionBitMask = BitMaskCategory.player
        bottomWall.physicsBody?.contactTestBitMask = BitMaskCategory.player
        
        wallPair.addChild(bottomWall)
        
        return wallPair
    }
    
    
}
