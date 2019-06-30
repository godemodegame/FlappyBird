import Foundation
import SpriteKit

class Base: SKSpriteNode {
    
    private let animation: SKAction = {
        var textures: [SKTexture] = []
        var action: SKAction
        
        for i in 1...4 {
            textures.append(SKTexture(imageNamed: "base\(i)"))
        }
        textures.append(SKTexture(imageNamed: "base1"))
        action = SKAction.animate(with: textures, timePerFrame: 0.05)
        
        return action
    }()
    
    func spawn(at point: CGPoint) -> Base {
        let base = Base(texture: SKTexture(imageNamed: "base1" ))
        
        base.anchorPoint = CGPoint(x: 0.5, y: 0)
        base.position = point
        base.scale(to: CGSize(width: 1536, height: 300))
        base.name = "base"
        
        base.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1536, height: 600))
        base.physicsBody?.isDynamic = false
        base.physicsBody?.affectedByGravity = false
        base.physicsBody?.categoryBitMask = BitMaskCategory.base
        base.physicsBody?.collisionBitMask = BitMaskCategory.player
        base.physicsBody?.contactTestBitMask = BitMaskCategory.player
        
        base.startAnimation()
        
        return base
    }
    
    func startAnimation() {
        self.run(SKAction.repeatForever(animation), withKey: "animation")
    }
    
    func stopAnimation() {
        self.removeAction(forKey: "animation")
    }
}
