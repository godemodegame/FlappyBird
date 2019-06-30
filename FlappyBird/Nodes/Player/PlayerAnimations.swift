import Foundation
import SpriteKit

extension Player {
    func startAnimation() {
        self.run(SKAction.repeatForever(animation), withKey: "animation")
    }
    
    func stopAnimation() {
        self.removeAction(forKey: "animation")
        self.texture = SKTexture(imageNamed: "yellowbird1")
    }
    
    func startMenuAnimation() {
        let moveUp = SKAction.move(to: CGPoint(x: self.position.x, y: self.position.y + 50), duration: 1)
        let moveDown = SKAction.move(to: CGPoint(x: self.position.x, y: self.position.y - 50), duration: 1)
        let action = SKAction.sequence([moveUp, moveDown])
        
        self.run(SKAction.repeatForever(action), withKey: "menuAnimation")
    }
    
    func stopMenuAnimation() {
        self.removeAction(forKey: "menuAnimation")
    }
}
